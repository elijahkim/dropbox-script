#!/bin/bash
# Bash script to get the external IP address
MYWANIP=$(curl http://mire.ipadsl.net | sed -nr -e 's|^.*<span class="ip">([0-9.]+)</span>.*$|\1| p')
echo "My IP address is: $MYWANIP"

IPold=$(cat /home/eli/Dropbox/miningrig-ip.txt)
echo "Previous IP Address: $IPold"

if [[ $IPold != $MYWANIP ]] ;
then
  echo "New IP"
  rm /home/eli/Dropbox/miningrig-ip.txt
  echo $MYWANIP >> /home/eli/Dropbox/miningrig-ip.txt;
  echo $MYWANIP;
else
  echo "Same IP";
fi
