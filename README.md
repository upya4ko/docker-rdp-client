# docker-rdp-client

Web-based implementation of RDP client.

usage:   
1. Clone repo
2. forward local port 3389 to RDP server using ssh
3. Put username to ./username
4. Put password to ./password 
5. `$ ./startAndRM.sh`
6. open in browser `http://127.0.0.1:8086/vnc.html`

OR use example script `rdpToRemoteServer.sh`

Add version support:      
1 - Windows 7 (rdesktop)   
2 - Windows 8+ (xfreerdp)   

[ssh port forwarding examples](http://pentestmonkey.net/cheat-sheet/ssh-cheat-sheet)

