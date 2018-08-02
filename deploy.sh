#!/bin/bash

as_root()
{
  # Make sure we are root
  if [ $(id -u) -ne 0 ]
    then
      echo "Insufficient privileges."
      exit -1
  fi
}
as_root

PROJECT_NAME=flask_uwsgi
SRV_DEST=/srv/nginx/${PROJECT_NAME}_project

python3 -m pip install -r requirements.txt

mkdir -m 0755 $SRV_DEST
cp -r ${PROJECT_NAME} settings.py wsgi.py flask_uwsgi.ini $SRV_DEST

chown -R www-data:www-data $SRV_DEST

cp ${PROJECT_NAME}.service /etc/systemd/system
systemctl start ${PROJECT_NAME}

cat > /etc/nginx/sites-available/${PROJECT_NAME} << EOF_NGINX
server {
    listen 80;
    server_name localhost;

    location / {
        include uwsgi_params;
        uwsgi_pass unix:/tmp/${PROJECT_NAME}-uwsgi.sock;
    }
}

EOF_NGINX

ln -s /etc/nginx/sites-available/${PROJECT_NAME} /etc/nginx/sites-enabled/${PROJECT_NAME}
rm /etc/nginx/sites-enabled/default

# test syntax errors
sudo nginx -t

systemctl restart nginx

exit 0

