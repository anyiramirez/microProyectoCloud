#!/bin/bash
set -e

echo -e "\n\n🚀 Install and configure haproxy ... 🛠️"

echo -e "\n\nUpdating our haproxy repo..."
sudo apt update && apt upgrade -y


# ----------------- Error 503 message ----------------------------

echo -e "creating Error directory"
sudo mkdir -p /etc/haproxy/errors/person

echo -e "\n\n copying Instance1 service file into /etc/systemd/system/ route"
sudo cp -r /vagrant/Haproxy/ErrorPerson/503.http /etc/haproxy/errors/



# -------------------------------------------------------------------

# ------------ Instaling and Enabeling haproxy -------------------

echo -e "\n\n Instaling haproxy"
sudo apt install haproxy -y

echo -e "\n\n copying haproxy.cfg from sincronizer to path"
sudo cp -r /vagrant/Haproxy/haproxy.cfg /etc/haproxy/

echo -e "Reloading Daemon to recognize the new service"
sudo systemctl daemon-reload

echo -e "\n\n Enabeling haproxy"
sudo systemctl enable haproxy

echo -e "\n\n restart haproxy"
sudo systemctl restart haproxy

#-----------------------------------------------------------------






