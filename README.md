- **Complete 1base.sh install\setup from infrastructure_project.**

```
cd ~/dev/infrastructure_project
sudo ./9install_webserver.sh nginx
cd ~/dev
git clone https://github.com/dmarsh19/flask_uwsgi.git flask_uwsgi_project
cd flask_uwsgi_project
sudo ./deploy.sh
```

