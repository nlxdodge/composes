# Composes

A collection of my privately used container compose files.
Check out the [DNS](DNS.md) settings to manually set the right url's again.

## Overview

![Network Overview](./diagram.png)

## All services

| Name         | Description                            |
| ------------ | -------------------------------------- |
| Arcane       | Dashboard for containers orchestration |
| Flood        | Torrent Web UI                         |
| Bazarr       | Subtitles finder                       |
| Seerr        | Media Requester Web UI                 |
| Gluetun      | VPN Network                            |
| Radarr       | Movie finder                           |
| Traefik      | Proxy/Gateway                          |
| Jellyfin     | Media Viewer                           |
| Sonarr       | Series/Anime finder                    |
| Scrutiny     | S.M.A.R.T. checker and Web UI          |
| Prowlarr     | Indexer for finding things             |
| Transmission | Torrenting client                      |
| Keydungeon   | Encrypted password manager API and APP |

## Commands

1. Read through the README.md's in the other folders for more setup
2. Fill in the `.env` file if needed check the `.env.tmp` file as template.

Clone the repo to `~/composes`.
To make the composes is runable add this to .bashrc: `export PATH="$HOME/composes:$PATH"`.
And check/run `chmod +x ~/composes/composes`.

Run `composes pull` to update all repositories, excluding itself.
Run `composes setup` to create folders, copy over defaults and setup the docker networks used, also enable weekly Sunday upgrades via SystemD.
Run `composes start [none/service]` to start the first time to pull containers and start them all.
Run `composes upgrade [none/service]` to manually upgrade the containers.
Run `composes restart [none/service]` to restart all/some services.
Run `composes stop [none/service]` to stop all/some services.
Run `composes remove [none/service]` to clean all containers up.
Run `composes logs [none/service]` to clean all contai
Run `composes status [none/service]` to print out a status of everything deployed.
Run `composes list` to print out a nice list of containers.
Run `composes help` to list all commands again like this.

## Folder structure

```txt
${HOME}/composes/ -> this repository.
${HOME}/composes/scripts -> houses all the scripts in the composes project to start all the stacks.
${HOME}/configurations/ -> for all the configurations used in containers, here everything will be stored that is non volatile.
```

## DNS setup, provider independant

| Record Type | From     | To                        |
| ----------- | -------- | ------------------------- |
| A           | basingse | HOME_IP_ADDRESS           |
| CNAME       | key      | basingse.gerbenveenhof.nl |
| CNAME       | arcane   | basingse.gerbenveenhof.nl |
| CNAME       | bazarr   | basingse.gerbenveenhof.nl |
| CNAME       | flood    | basingse.gerbenveenhof.nl |
| CNAME       | jellyfin | basingse.gerbenveenhof.nl |
| CNAME       | prowlarr | basingse.gerbenveenhof.nl |
| CNAME       | radarr   | basingse.gerbenveenhof.nl |
| CNAME       | scrutiny | basingse.gerbenveenhof.nl |
| CNAME       | seerr    | basingse.gerbenveenhof.nl |
| CNAME       | sonarr   | basingse.gerbenveenhof.nl |
| CNAME       | traefik  | basingse.gerbenveenhof.nl |
| CNAME       | wizarr   | basingse.gerbenveenhof.nl |
