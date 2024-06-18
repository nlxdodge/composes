# DNS settings

Back-up of DNS settings made at the current provider, that had to be done manually.
Copy and paste them over but supplying the IP_ADDRESS of your server's outbound connection.

| Name                   | Type | IP Address                               |
| ---------------------- | ---- | ---------------------------------------- |
| craft                  | A    | <IP_ADDRESS>                             |
| _minecraft._tcp.craft. | SRV  | 5 0 25565 <IP_ADDRESS>.gerbenveenhof.nl. |
| flood                  | A    | <IP_ADDRESS>                             |
| jellyfin               | A    | <IP_ADDRESS>                             |
| portainer              | A    | <IP_ADDRESS>                             |
| traefik                | A    | <IP_ADDRESS>                             |