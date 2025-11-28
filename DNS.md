# DNS settings

Back-up of DNS settings made at the current provider, that had to be done manually.
Copy and paste them over but supplying the IP_ADDRESS of your server's outbound connection.

TODO make everything accessable via IPV6 as well

| Name                       | Type  | IP Address                           |
| -------------------------- | ----- | ------------------------------------ |
| basingse                   | A     | <IP_ADDRESS>                         |
| bazarr                     | CNAME | basingse.gerbenveenhof.nl.           |
| bedrock                    | CNAME | basingse.gerbenveenhof.nl.           |
| craft                      | CNAME | basingse.gerbenveenhof.nl.           |
| flood                      | CNAME | basingse.gerbenveenhof.nl.           |
| jellyfin                   | CNAME | basingse.gerbenveenhof.nl.           |
| jellyseer                  | CNAME | basingse.gerbenveenhof.nl.           |
| map                        | CNAME | basingse.gerbenveenhof.nl.           |
| portainer                  | CNAME | basingse.gerbenveenhof.nl.           |
| prowlarr                   | CNAME | basingse.gerbenveenhof.nl.           |
| radarr                     | CNAME | basingse.gerbenveenhof.nl.           |
| scrutiny                   | CNAME | basingse.gerbenveenhof.nl.           |
| sonarr                     | CNAME | basingse.gerbenveenhof.nl.           |
| test                       | CNAME | basingse.gerbenveenhof.nl.           |
| traefik                    | CNAME | basingse.gerbenveenhof.nl.           |
| \_minecraft.\_tcp.bedrock. | SRV   | 5 0 19132 bedrock.gerbenveenhof.nl.  |
| \_minecraft.\_udp.bedrock. | SRV   | 5 0 19132 basingse.gerbenveenhof.nl. |
| \_minecraft.\_tcp.craft.   | SRV   | 5 0 25565 basingse.gerbenveenhof.nl. |
