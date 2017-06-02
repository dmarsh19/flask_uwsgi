-spin up new aws instance (ubuntu server)
  -security group to Flask-Default-Web-Server
  -existing key pair (ec2-zeromq**)
-From local machine, grab public dns from AWS console
-Update putty hostname
-when opening, may need to login as user "ubuntu", no password
-git is already installed by default on these images, if not:
sudo apt-get install -y git

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
sudo git clone https://github.com/dmarsh19/flask_uwsgi.git
sudo python3 -m pip install -r flask_uwsgi/requirements.txt
touch flask_uwsgi/settings.py
sudo service lighttpd restart
navigate to the url


requires python3

This is still a dev webserver.
For production:
    write log to /var/log
    run under low permission user




#chmod 775 flask_lighttpd.fcgi
#chmod 775 runserver.py

# may need to change python path in these files:
runserver.fcgi (2 locations)
runserver.py
settings.py (APP_LOGFILE)
below for bin-path in lighttpd.conf, fcgi