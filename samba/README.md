# How to setup

Samba runs in a container and replaces the native Samba install on the host.

Create a `.env` file in this folder with the following contents:

## .env

```txt
SAMBA_USER=
SAMBA_PASSWORD=
```

The `md0` share (`/mnt/md0` on the host) is defined in `docker-compose.yml`. To add shares, add a `SAMBA_VOLUME_CONFIG_<name>` line and a matching `volumes` entry (host path on the left, container path on the right). `UID_<user>` must match the owner of the files on the host, which is usually `1000`. Check with `id -u`.

Before starting, stop and disable the native Samba so it does not block ports 139 and 445:

```bash
sudo systemctl disable --now smbd nmbd
```

Then start the container:

```bash
docker-compose up -d
```
