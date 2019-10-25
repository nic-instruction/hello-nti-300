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
python manage.py createsuperuser   # <-work around this to add a user   
newproject/settings.py    # sed search and replace
python manage.py runserver 0.0.0.0:8000
