# Based on https://flask.palletsprojects.com/en/2.0.x/quickstart/

from flask import Flask, escape

app = Flask(__name__)


@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"


@app.route("/favicon.ico")
def favicon_empty():
    return ''


@app.route("/user/<username>")
def hello_name(username):
    return f"Hello, user '{escape(username)}'!"
