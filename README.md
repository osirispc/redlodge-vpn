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


Excellent, Agent — versioning and documentation: the final ritual to seal your work in the archives.
Let’s tag this build properly and give your README the dignity it deserves.

---

## ☕ Step 38 — Tag the Release

From your project root:

```bash
cd ~/projects/redlodge-vpn
```

### 1️⃣  Create a release tag

```bash
git tag -a v1.0-portal -m "Red Lodge Portal v1.0 – Flask VPN Gateway with Captive Twin Peaks Video Store Page"
```

### 2️⃣  Push the tag to GitHub

```bash
git push origin v1.0-portal
```

You can now always return to this exact build with:

```bash
git checkout v1.0-portal
```

---

## 📜 Step 39 — Update Your README

Open the file:

```bash
nano README.md
```

Replace its contents with this fresh draft (you can adjust tone later):

```markdown
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

Visit `http://<server-ip>:5055`
or via VPN: `http://10.10.0.1:5055`

---

## 🧭 Version

**v1.0-portal** — Initial release with working visuals & unlock logic.

---

*"Through the red curtains, all connections are revealed."*

