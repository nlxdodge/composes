# Composes

A collection of my privately used container compose files.

Check out the [DNS](DNS.md) settings to manually set the right url's again.
And run the `./reboot-all.sh` file after doing `chmod +x reboot-all.sh` to make the file runable.
This will (remove if still there) and setup all the containers used in this repo.

## All services

| Name      | Port        | Description                       |
| --------- | ----------- | --------------------------------- |
| Flood     | 3000        | Rtorrent Web-UI                   |
| Postgres  | 5432        | Relational Database               |
| SonarQube | 7000        | Code Quality and Security scanner |
| Traefik   | 8080        | gateway (Proxy and SSL as well)   |
| Jellyfin  | 8096        | Mediaviewer (Plex alterative)     |
| Portainer | 9000        | Container Web-UI                  |
| Obsidian  | 9001        | Obsidian Note taking Web-UI       |
| Gluetun   | Not exposed | VPN Container                     |
| RTorrent  | Not exposed | Torrent Container                 |
