# Keydungeon MEGA backup

This stack uses a small Rust filesystem watcher and watches the Keydungeon backend source directory and the host backup directory. It uploads the backend `.env` as `mega:keydungeon/.env` and copies the contents of `~/keydungeon/backups` under `mega:keydungeon/backups/`. It performs an initial upload when the container starts and then uploads again after file creation, replacement, or writes (with a short debounce).

The watcher is built from `src/main.rs` in the `Containerfile`; it invokes rclone for transfers. Uploads use `rclone copy`/`copyto` with `--ignore-times`. MEGA does not expose hashes or modification times to rclone, so the watcher explicitly reuploads the selected files when it sees a change. The remote is **not mirrored**: deleting or renaming a local file does not delete the cloud copy. The container mounts source files read-only.

## Configure rclone for MEGA

1. Log in to MEGA in a browser at least once so MEGA has generated the account's encryption key.
2. Create a private config directory on the host:

   ```sh
   mkdir -p "$HOME/configurations/keydungeon-mega"
   chmod 700 "$HOME/configurations/keydungeon-mega"
   ```

3. Install rclone on the host and run its interactive configuration, saving the config at the dedicated path:

   ```sh
   rclone config --config "$HOME/configurations/keydungeon-mega/rclone.conf"
   ```

   Create a new remote named `mega`, choose the `mega` storage type, and enter your MEGA account email and password when prompted. Rclone stores its password in obscured form; protect the config file as a secret:

   ```sh
   chmod 600 "$HOME/configurations/keydungeon-mega/rclone.conf"
   ```

   Avoid putting the password directly in a shell command or committing the config. Rclone's obscured password is not encryption, so file permissions matter. You can verify the remote with `rclone lsd --config "$HOME/configurations/keydungeon-mega/rclone.conf" mega:` before starting the container.

## Start

The defaults expect these host paths:

- Backend `.env`: `~/keydungeon/backend/src/.env`
- Generated backups: `~/keydungeon/backups/`
- Rclone config: `~/configurations/keydungeon-mega/rclone.conf`

Ensure the two source directories and the config directory exist. Start from this folder:

```sh
cd ~/composes/backup
docker compose up -d --build
```

Check the first upload and watcher status with:

```sh
docker compose logs -f
```

The container runs as UID/GID `1000:1000` by default, so it must be able to read the source files and rclone config. If your host account uses different IDs, set `PUID` and `PGID` in `backup/.env` or in the shell before running Compose.

## Overrides

Compose supports these environment variables (or values in a local, ignored `backup/.env` file):

| Variable | Default | Purpose |
| --- | --- | --- |
| `KEYDUNGEON_BACKEND_SRC` | `${HOME}/keydungeon/backend/src` | Host directory containing the backend `.env` |
| `KEYDUNGEON_BACKUPS_DIR` | `${HOME}/keydungeon/backups` | Host directory containing generated backups |
| `RCLONE_CONFIG_DIR` | `${HOME}/configurations/keydungeon-mega` | Host directory containing `rclone.conf` |
| `MEGA_REMOTE` | `mega:keydungeon` | Remote base path; must refer to an rclone remote named `mega` unless overridden |
| `PUID` / `PGID` | `1000` | Container user/group IDs for reading host files |
| `WATCH_DEBOUNCE_SECONDS` | `2` | Quiet period before an upload begins |

For example, set `KEYDUNGEON_BACKEND_SRC=/different/path/backend/src` if the `.env` lives elsewhere. Ensure both mounted source directories exist before starting. The watcher processes all files in the backup directory, not only the current three, so future generated backups are included too.

Because the watcher invokes MEGA uploads on changes and reuploads selected files to work around MEGA's lack of hashes/mtimes, avoid an excessively short debounce interval; rapid successive MEGA operations can be throttled by the service.
