#!/bin/bash
yum -y install wget
for packages in $(cat packages.txt); do 
   yum -y install $packages
done
