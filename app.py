from flask import Flask, render_template, send_from_directory
from whitenoise import WhiteNoise
import os

app = Flask(__name__)
app.wsgi_app = WhiteNoise(app.wsgi_app, root='static/')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/static/<path:path>')
def send_static(path):
    return send_from_directory('static', path)

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port) 