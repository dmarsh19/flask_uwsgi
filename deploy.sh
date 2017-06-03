mkdir ~/dev
cd ~/dev
git clone https://github.com/dmarsh19/infrastructure.git infrastructure_project
sudo ./infrastructure_project/1install_base.sh
./infrastructure_project/2setup_base.sh
source ~/.bashrc
sudo ./infrastructure_project/12install_nginx.sh
cd /var/www
# will install as root, needs permissions set for a web user (www-data?)
# rename local dir in /var/www from git clone to the url? (i.e. twiml.admrsh.com)
# the last param in git clone command is the name of the directory to be created
# this is a barebones web app. No virtualenv.
# and yes, maybe the entire project shouldn't be in /var/www. chmod your files right and you'll be fine.
sudo git clone https://github.com/dmarsh19/flask_uwsgi.git
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
