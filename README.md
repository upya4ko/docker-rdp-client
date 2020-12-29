# doker-rdp-client

Web-based implementation of RDP client.

usage:
1. forward local port 3389 to RDP server using ssh
2. `$ ./startAndRM.sh`
3. open in browser `http://127.0.0.1:8086/vnc.html`

ssh port forwarding example:
```
ssh -L 0.0.0.0:3389:%RdpServerIp%:3389 %SSHUser%@%proxyServer%
```
