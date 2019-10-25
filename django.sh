#!/bin/bash
yum -y install python-pip
pip install virtualenv
pip install --upgrade pip
mkdir ~/newproject
cd ~/newproject
virtualenv newenv
source newenv/bin/activate
pip install django
django-admin --version
source newenv/bin/activate
django-admin startproject newproject
cd newproject
python manage.py migrate
python manage.py createsuperuser #<-work around this to add a user
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@myproject.com', 'Pa$$w0rd')" | python manage.py shell
newproject/settings.py #sed search and replace
myip=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
echo $myip
sed -i "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \[\'$myip\'\]/g" newproject/settings.py 
pythonmanage.py runserver 0.0.0.0:8000
