# Composes

A collection of my privately used container compose files.

Check out the [DNS](DNS.md) settings to manually set the right url's again.
And run the `./reboot-all.sh` file after doing `chmod +x reboot-all.sh` to make the file runable.
This will (remove if still there) and setup all the containers used in this repo.

## Overview

![Network Overview](./diagram.png)

## All services

| Name      | Port | Description                       |
| --------- | ---- | --------------------------------- |
| Flood     | 3000 | Secure UI for Torrents            |
| Jellyseer | 5055 | Media Requester                   |
| Postgres  | 5432 | Relational Database               |
| Bazarr    | 6767 | Subtitle downloader               |
| Gluetun   | 6881 | VPN Network for other containers  |
| RTorrent  | 6881 | Torrent Downloader                |
| SonarQube | 7000 | Code Quality and Security scanner |
| Radarr    | 7878 | Movie finder                      |
| Traefik   | 8080 | Gateway                           |
| Jellyfin  | 8096 | Mediaviewer                       |
| Sonarr    | 8989 | Series/Anime finder               |
| Portainer | 9000 | Container Management              |
| Scrutiny  | 9001 | S.M.A.R.T. viewer/notifier        |
| Prowlarr  | 9696 | Indexer for Radarr & Sonarr       |

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
~/composes/scripts -> houses all the scripts in the composes project to start the whole stack.
~/configurations/ -> for all the configurations used in containers, here everything will be stored.
```
