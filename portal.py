#!/usr/bin/env python3
# ==========================================================
#  Red Lodge Captive Portal - Flask Unlock Service
# ==========================================================
from flask import Flask, request, render_template, redirect
import subprocess, os

app = Flask(__name__, static_folder='static', template_folder='templates')

# ---- Home page ----
@app.route('/')
def index():
    return render_template('index.html')

# ---- Unlock route ----
@app.route('/enter', methods=['POST'])
def enter():
    client_ip = request.remote_addr
    print(f"[+] Unlock requested from {client_ip}")

    script_path = os.path.join('setup', 'allow_jellyfin.sh')
    subprocess.run(['sudo', script_path, client_ip])
    return redirect("http://192.168.199.193:8096")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5055)
