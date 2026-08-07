#!/bin/bash

# 1. Update and install Tinyproxy for lightweight, secure proxy routing
sudo apt update && sudo apt install -y tinyproxy

# 2. Configure Tinyproxy to allow connections from the VirtualBox host-only network
sudo sed -i 's/^Allow 127.0.0.1/# Allow 127.0.0.1\nAllow 192.168.56.0\/24/' /etc/tinyproxy/tinyproxy.conf

# 3. Restart the proxy service to apply configuration changes
sudo systemctl restart tinyproxy
sudo systemctl enable tinyproxy
