#!/bin/sh

serverName=hiddenserver
serverIp=192.168.1.111
proxyServer=exposedServer
proxyUser=sshUser
rdpUsername=WindowsUser
# get password from pass storage
rdpPassword=$(pass show servers/$serverName/$rdpUsername)

# start ssh
ssh -M -S my-ctrl-socket -fnNT -L 0.0.0.0:3389:$serverIp:3389 $proxyUser@$proxyServer 

# set user/pass
echo $rdpUsername > ./username
echo $rdpPassword > ./password

# run docker
docker-compose up --build  && docker-compose rm -fsv

# check PID
#$ ssh -S my-ctrl-socket -O check jm@sampledomain.com

# kill ssh
ssh -S my-ctrl-socket -O exit $proxyUser@$proxyServer

# cleanup user/pass
echo username > ./username
echo password > ./password

