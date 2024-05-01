# How to setup

Download the Windscribe configuration and paste that on your server in the `home/user/congigurations/windscribe` folder.
Also include the creds.txt with the first line for the username, second line for the password.
And change line 8 in the configuration with `auth-user-pass /etc/openvpn/creds.txt`.

## Building

```Dockerfile
podman build --cap-add=NET_ADMIN --device=/dev/net/tun:/dev/net/tun .
```
