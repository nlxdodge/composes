# Adding new drives

Run `lsblk` and add all drives to the list in the Docker Compose file.

To get Discord notifications add this to the configuration file in `/home/user/configurations/scruntiny/scrutiny.yaml`

```bash
notify:
  urls:
    - discord://token@webhookid
```
