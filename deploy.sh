sudo touch flask_uwsgi/settings.py
sudo chown -R www-data:www-data /var/www/flask_uwsgi
# sticky bit to keep new files owned by www-data; 755
sudo chmod -R u=rwX,g=srX,o=rX /var/www/flask_uwsgi
sudo python3 -m pip install -r flask_uwsgi/requirements.txt
sudo mv flask_uwsgi/flask_uwsgi.service /etc/systemd/system
sudo service flask_uwsgi start
sudo mv flask_uwsgi/flask_uwsgi.nginx /etc/nginx/sites-available/flask_uwsgi
sudo ln -s /etc/nginx/sites-available/flask_uwsgi /etc/nginx/sites-enabled/flask_uwsgi
sudo rm /etc/nginx/sites-enabled/default
# test syntax errors
sudo nginx -t
sudo service nginx restart
