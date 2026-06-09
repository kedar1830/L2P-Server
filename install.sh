#!/bin/bash

# 1. Update and Install
apt update && apt upgrade -y
pkg install nodejs tmux wget git proot -y

# 2. Setup Server Directory
termux-setup-storage -y
mkdir -p /storage/emulated/0/termux/Server/public
cd /storage/emulated/0/termux/Server

# 3. Initialize Node.js
npm init -y
npm i express

# 4. Create server.js
cat << 'EOF' > server.js

const express = require('express');
const path = require('path');
const app = express();

app.use((req, res, next) => {
    console.log(`IP: ${req.socket.remoteAddress}: ${req.url}`);
    next();
});

app.use(express.static(path.join(__dirname, 'public')));

app.use((req, res) => {
    res.status(404).send('404 Not Found');
});

const port = process.env.PORT || 3000;
app.listen(port, '127.0.0.1', () => {
    console.log(`Server running on http://127.0.0.1:${port}/`);
});
EOF

# 5. Create a dummy index file so the server isn't empty
echo "<h1>Server is Live!</h1>" > public/index.html

# 6. Create Start Command (Lstart)
echo "node /storage/emulated/0/termux/Server/server.js" > $PREFIX/bin/Lstart
chmod +x $PREFIX/bin/Lstart

# 7. Install Ngrok
cd $HOME
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz
tar -xvzf ngrok-v3-stable-linux-arm64.tgz
chmod +x ngrok

# 8. Configure Ngrok
echo "--- Ngrok Configuration ---"
# 1) Prompt for Ngrok Authtoken
read -p "Enter your Ngrok Authtoken: " USER_TOKEN

# 2) Prompt for Port (with default 3000)
read -p "Enter your Port [Default: 3000]: " USER_PORT
USER_PORT=${USER_PORT:-3000}

# 3) Prompt for Ngrok Static Domain
read -p "Enter your Ngrok Static Domain Name: " USER_DOMAIN
echo "---------------------------"

mkdir -p ~/.config/ngrok
cat << EOF > ~/.config/ngrok/ngrok.yml

version: "3"
agent:
    authtoken: $USER_TOKEN
tunnels:
  webapp:
    proto: http
    addr: $USER_PORT
    url: $USER_DOMAIN
EOF


# 9. Create Ngrok Start (Pstart)
mv ngrok $PREFIX/bin/
echo "ngrok start webapp" > $PREFIX/bin/Pstart
chmod +x $PREFIX/bin/Pstart

# 10. Create the Master Runner (server)
cat << 'EOF' > $PREFIX/bin/server
#!/bin/bash
SESSION="web_server"
tmux new-session -d -s $SESSION
tmux split-window -v
tmux send-keys -t $SESSION:0.0 "Lstart" C-m
tmux send-keys -t $SESSION:0.1 "termux-chroot" C-m
sleep 2
tmux send-keys -t $SESSION:0.1 "Pstart" C-m
tmux attach-session -t $SESSION
EOF
chmod +x $PREFIX/bin/server

echo "Setup complete! Type 'server' to start everything."
