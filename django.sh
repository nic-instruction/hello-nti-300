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
django-admin startproject newproject   
cd newproject/    
python manage.py migrate   
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@newproject.com','NTI300NTI300')" | python manage.py shell   
newproject/settings.py    # sed search and replace
python manage.py runserver 0.0.0.0:8000