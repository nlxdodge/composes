# How to setup

For Windscribe go to <https://windscribe.com/getconfig/openvpn> and click on Get Credentials, we will only use the username and password from this page.
Next, on your server clone this repo, and create a `.env` file with the following contents.
Here replace the username and password with what you just have generated.

```text
OPENVPN_USER=
OPENVPN_PASSWORD=
```

Next either use Docker or Podman to create the stack.

```bash
docker-compose up -d
```

or

```bash
podman-compose up -d
```

Now you have:

- Rtorrent running behind Windscribe
- Flood for adding torrents
- Jellyfin to display them
