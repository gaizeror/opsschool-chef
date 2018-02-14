#!/bin/bash -e

echo "update apt index cache"
apt-get update

echo "install nginx"
apt-get install -y nginx

echo "create site directory"
mkdir /opt/opsschool

echo "create site html"
cat <<-EOH > /opt/opsschool/index.html
<html>
<body bgcolor="#000000">
<img src="logo.png" alt="Mountain View">
</html>
EOH

echo "download logo"
wget https://static.wixstatic.com/media/ba2a09_b5ebfce1a107401c81962d1b4eb67b4a~mv2.png/v1/fill/w_214,h_108,al_c,lg_1/ba2a09_b5ebfce1a107401c81962d1b4eb67b4a~mv2.png -O /opt/opsschool/logo.png

echo "fix permissions"
chown -R www-data:www-data /opt/opsschool/

echo "disable default site"
rm /etc/nginx/sites-enabled/default

echo "create nginx site config"
cat <<-EOH > /etc/nginx/sites-available/logo
server {
  listen 80;
  server_name localhost;

  location / {
    root /opt/opsschool/;
  }
}
EOH

echo "enable site"
ln -s /etc/nginx/sites-available/logo /etc/nginx/sites-enabled/

echo "reload nginx"
service nginx restart

exit 0
