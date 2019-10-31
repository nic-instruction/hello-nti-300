#!/bin/bash
# see https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-apache-and-mod_wsgi-on-centos-7
yum -y install httpd mod_wsgi  #needs to take pleace before migrate
echo 'STATIC_ROOT = os.path.join(BASE_DIR, "static/")' >> /opt/django/project1/project1/settings.py #need to take place before migrate

source /opt/django/django-env/bin/activate
/opt/django/project1/manage.py collectstatic

#written into file: /etc/httpd/conf.d/django.conf

echo "Alias /static /opt/django/project1/static/
<Directory /opt/django/project1/static/>
    Require all granted
</Directory>
<Directory /opt/django/project1/project1>
    <Files wsgi.py>
        Require all granted
    </Files>
</Directory>
WSGIDaemonProcess project1 python-path=/opt/django/project1:/opt/django/django-env/lib/python2.7/site-packages/
WSGIProcessGroup project1
WSGIScriptAlias / /opt/django/project1/project1/wsgi.py
" > /etc/httpd/conf.d/django.conf

usermod -a -G nicolebade apache
chmod 710 /opt/django
chmod 664 /opt/django/project1/db.sqlite3
chown :apache /opt/django/project1/db.sqlite3
chown :apache /opt/django
systemctl start httpd
systemctl enable httpd
