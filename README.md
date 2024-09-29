# Composes

A collection of my privately used container compose files.

Check out the [DNS](DNS.md) settings to manually set the right url's again.
And run the `./reboot-all.sh` file after doing `chmod +x reboot-all.sh` to make the file runable.
This will (remove if still there) and setup all the containers used in this repo.

## All services

| Name      | Port | Description                          |
| --------- | ---- | ------------------------------------ |
| Flood     | 3000 | Rtorrent Web-UI                      |
| Jellyseer | 5055 | Media Requester Web-UI               |
| Postgres  | 5432 | Relational Database                  |
| Gluetun   | 6881 | VPN Container                        |
| RTorrent  | 6881 | Torrent Container                    |
| SonarQube | 7000 | Code Quality and Security scanner    |
| Radarr    | 7878 | Radarr Web-UI                        |
| Traefik   | 8080 | gateway (Proxy and SSL as well)      |
| Jellyfin  | 8096 | Mediaviewer (Plex alterative)        |
| Sonarr    | 8989 | Sonarr Web-UI                        |
| Portainer | 9000 | Container Web-UI                     |
| Scrutiny  | 9500 | S.M.A.R.T. Web-UI for failing drives |
| Prowlarr  | 9696 | Prowlarr Web-UI                      |

## Commands

1. Read through the README.md's in the other folders for more setup
2. Fill in `jellyfin/.env` file with OPEN VPN credentials: OPENVPN_USER and OPENVPN_PASSWORD.

Run `./setup.sh` to create folders and setup the default network used.

Then run `./start.sh` to start the first time pulling of containers and make them all work.

To update running containers run `./update.sh`.

Need to reset all the containers because of a mistake when developing? Use `./reset.sh`.

To stop the containers use the `./stop.sh` command.

Made an oopsie? remove everything with `./remove.sh`

## Folder structure

```txt
~/composes/ -> this repository.
~/configurations/ -> for all the configurations used in containers.
```
