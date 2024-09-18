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
| SonarQube | 7000 | Code Quality and Security scanner    |
| Radarr    | 7878 | Radarr Web-UI                        |
| Traefik   | 8080 | gateway (Proxy and SSL as well)      |
| Jellyfin  | 8096 | Mediaviewer (Plex alterative)        |
| Sonarr    | 8989 | Sonarr Web-UI                        |
| Portainer | 9000 | Container Web-UI                     |
| Scrutiny  | 9001 | S.M.A.R.T. Web-UI for failing drives |
| Prowlarr  | 9696 | Prowlarr Web-UI                      |
| Gluetun   | 6881 | VPN Container                        |
| RTorrent  | 6881 | Torrent Container                    |
