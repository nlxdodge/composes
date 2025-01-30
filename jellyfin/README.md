# How to setup

For Windscribe go to <https://windscribe.com/getconfig/openvpn> and click on Get Credentials, we will only use the username and password from this page.
Next, on your server clone this repo, and create a `.env` file with the following contents.
Here replace the username and password with what you just have generated.

## .env

```txt
OPENVPN_USER=
OPENVPN_PASSWORD=
TRANSMISSION_USERNAME=
TRANSMISSION_PASSWORD=
```

Next either use Docker or Podman to create the stack.

```bash
docker-compose up -d
# or
podman-compose up -d
```

Now you have:

- Transmission for downloading torrents
- Gluetun for routing the torrent traffic over a VPN (Windscribe in this case)
- Flood for adding torrents in a nice Web UI
- Jellyfin to display the contents 🏴‍☠️🦜
