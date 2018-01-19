#!/bin/bash
yum -y install httpd mod_ssl
systemctl enable httpd
systemctl start httpd

sed -i 's/^/#/g' /etc/httpd/conf.d/welcome.conf

echo -e "<html> \n<h1> Welcome, NTI-300 </h1> \n<h2> yay, I'm having so much fun with linux</h2> \n</html>" > /var/www/html/index.html
