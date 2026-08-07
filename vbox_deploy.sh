#!/bin/bash

# Integrated Avodah LLC - Automated VirtualBox & Ubuntu-Windows Node Provisioning
# Organization: Integrated Avodah LLC
# Location: Lawrence, KS

echo "[*] Initializing Integrated Avodah LLC Virtualization Node Setup..."

# 1. Update system package repositories
sudo apt update && sudo apt upgrade -y

# 2. Install prerequisite utilities
sudo apt install -y software-properties-common curl wget build-essential dkms linux-headers-$(uname -r)

# 3. Add VirtualBox repository and install non-interactively
echo "[*] Configuring VirtualBox repositories..."
sudo apt install -y debian-archive-keyring
wget -qO- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor -o /usr/share/keyrings/virtualbox-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/virtualbox-archive-keyring.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

sudo apt update
sudo apt install -y virtualbox-7.0 virtualbox-ext-pack

# 4. Add current user to vboxusers group for hardware access
sudo usermod -aG vboxusers $USER

echo "[✓] VirtualBox installation and environment node provisioning completed successfully."
echo "[✓] System is ready for cross-platform Windows-Ubuntu image mounting under Integrated Avodah LLC governance."
