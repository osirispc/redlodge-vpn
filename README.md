# 🎬 Red Lodge VPN Portal

A WireGuard + Flask captive portal built for the **Twin Peaks-style Red Lodge Video Club**.  
When a client connects through WireGuard, they’re greeted by a retro 1980s video-store page —  
red velvet curtains, a portrait of the host, and a glowing **“Enter the Lodge ▶”** button.  
Clicking the button unlocks access to the Jellyfin media server.

---

## 🧩 Features
- 🔐 Secure WireGuard VPN with static IP assignments  
- 🧱 UFW scripts to grant or revoke Jellyfin access dynamically  
- 🎞️ Flask captive-portal service (port 5055)  
- 🖼️ Custom visuals — red curtains & host portrait  
- ✨ Fade-in animation and Twin Peaks aesthetic  
- 🧰 Full setup scripts under `/setup`  

---

## 🗂️ Structure
setup/ – install, key, and UFW scripts
wg/ – WireGuard configuration templates
templates/ – Flask HTML pages
static/img/ – portal images (portrait, curtains)
portal.py – main Flask app

---

## 🚀 Run
```bash
sudo python3 portal.py




, a portrait of the host, and a glowing **“Enter the Lodge ▶”** button.  
Clicking the button unlocks access to the Jellyfin media server.

---

## 🧩 Features
- 🔐 Secure WireGuard VPN with static IP assignments  
- 🧱 UFW scripts to grant or revoke Jellyfin access dynamically  
- 🎞️ Flask captive-portal service (port 5055)  
- 🖼️ Custom visuals — red curtains & host portrait  
- ✨ Fade-in animation and Twin Peaks aesthetic  
- 🧰 Full setup scripts under `/setup`  

---

## 🗂️ Structure
```

setup/          – install, key, and UFW scripts
wg/             – WireGuard configuration templates
templates/      – Flask HTML pages
static/img/     – portal images (portrait, curtains)
portal.py       – main Flask app

````

---

## 🚀 Run
```bash
sudo python3 portal.py
````

## 🧭 Version

**v1.0-portal** — Initial release with working visuals & unlock logic.

---

*"Through the red curtains, all connections are revealed."*

