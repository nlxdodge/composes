FROM jesec/flood:latest

USER root
RUN apk add --no-cache openvpn
CMD ["openvpn", "--config", "/etc/openvpn/config.ovpn"]