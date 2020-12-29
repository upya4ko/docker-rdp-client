# docker-rdp-client

Web-based implementation of RDP client.

usage:   
0. Clone repo
1. forward local port 3389 to RDP server using ssh
2. Put username to ./username
3. Put password to ./password 
4. `$ ./startAndRM.sh`
5. open in browser `http://127.0.0.1:8086/vnc.html`

OR use example script `rdpToRemoteServer.sh`

Add version support:   
1 - Windows 7 (rdesktop)
2 - Windows 8+ (xfreerdp)

[ssh port forwarding examples](http://pentestmonkey.net/cheat-sheet/ssh-cheat-sheet)

