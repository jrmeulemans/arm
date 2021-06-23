#!/bin/bash

# Update Repos
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-add-repository https://packages.microsoft.com/ubuntu/18.04/prod
sudo apt-get update -y

# Install nginx/apache
sudo apt install apache2 -y

# /var/www/html/index.html
sudo service apache2 stop
sudo rm /var/www/html/index.html
sudo touch /var/www/html/index.html

sudo cat <<EOT >> /var/www/html/index.html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>OTEEMO WEB</title>
    <style type="text/css" media="screen">
    </style>
  </head>
  <body>
    <div class="main_page">
        <b>WEB SERVER: JRMUBU</b>
    </div>
  </body>
</html>
EOT

sudo service apache2 start
