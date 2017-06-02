#!/usr/bin/env python3

from flask_uwsgi import app

if __name__ == '__main__':
    app.run('0.0.0.0')