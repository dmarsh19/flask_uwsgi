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
# if development (need a virtualenv), follow the tabbed instructions (then skip past to #######):
#   git clone https://github.com/dmarsh19/flask_uwsgi.git flask_uwsgi
#   cd ..
#   ./dev/infrastructure_project/6init_project.py
#   #flask_uwsgi; Y; 3
#   workon flask_uwsgi
#   # you'll need to edit the nginx config to point to the correct sock location and
#   # edit wsgi.py to run the virtualenv python
cd /var/www
# will install as root, needs permissions set for a web user (www-data?)
# rename local dir in /var/www from git clone to the url? (i.e. twiml.admrsh.com)
# the last param in git clone command is the name of the directory to be created
# this is a barebones web app. No virtualenv.
# and yes, maybe the entire project shouldn't be in /var/www. chmod your files right and you'll be fine.
sudo git clone https://github.com/dmarsh19/flask_uwsgi.git
./flask_uwsgi/deploy.sh
#navigate to the url


#write log to /var/log
#settings.py (APP_LOGFILE)


