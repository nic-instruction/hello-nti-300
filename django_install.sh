#!/bin/bash
sudo -u 
yum install python-pip -y
pip install virtualenv
pip install --upgrade pip
sudo mkdir /opt/django
cd /opt/django

yum install epel-release -y
yum install python34 python-pip -y
#Upgrades python.

virtualenv -p python3 django
cd django
source bin/activate

pip install django
django-admin startproject project1

cd ..
yum install git -y



sudo -u nicolebade
virtualenv -p python3 django
cd opt/django/django
source bin/activate
/opt/django/django/project1/manage.py runserver 0.0.0.0:8000&
