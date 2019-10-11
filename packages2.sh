#!/bin/bash
if [ -e /usr/bin/wget ]; then 
  exit 0;
fi
yum -y install wget
wget https://raw.githubusercontent.com/nic-instruction/hello-nti-300/master/packages.txt
for packages in $(cat packages.txt); do 
   yum -y install $packages
done
