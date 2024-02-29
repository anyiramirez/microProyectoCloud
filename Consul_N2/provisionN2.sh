#!/bin/bash
set -e

#Scope variables
install_dir="/home/vagrant/consul/app"

echo -e "\n\n🚀 Install and configure our Consul node 1 into the cluster  and activating instances ... 🛠️"

echo -e "\n\nUpdating our nodeTwo repo..."
sudo apt update && apt upgrade -y


# --------------------- instalation of specific dependencies ---------------------
echo -e "\n\n Installing and lunching of Consul"

echo -e "\n\n step one of consul installation according to webpage "

echo -e "\n\n wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg"
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

echo -e "\n\n Installing Consul"
sudo apt update && sudo apt install consul -y

echo -e "\n\n Installing nodejs"
sudo apt install nodejs -y

echo -e "\n\n Installing npm"
sudo apt install npm -y
# ---------------------------------------------------------------------

# ---------------- Services from sincronized path to /etc/systemd/system/ ---------
echo -e "\n\n copying consulN1 service file into /etc/systemd/system/ route"
sudo cp -r /vagrant/Consul_N2/Consul_exec_services/consulN2.service /etc/systemd/system/

echo -e "\n\n copying Instance1 service file into /etc/systemd/system/ route"
sudo cp -r /vagrant/Consul_N2/Consul_exec_services/instance_con_1.service /etc/systemd/system/

echo -e "\n\n copying Instance1 service file into /etc/systemd/system/ route"
sudo cp -r /vagrant/Consul_N2/Consul_exec_services/instance_con_2.service /etc/systemd/system/


#-------------------------------------------------------------------------


# ---------------------- Consul Agent launch -------------------------------------
echo -e "\n\n Configuration and launch of services"

echo -e "\n\n Activation of Consul Agent by service"

echo -e "\n\n creating data directory" 
sudo mkdir -p /var/lib/consul

echo -e "giving admin permission"
sudo chown -R consul:consul /var/lib/consul

echo -e "Reloading Daemon to recognize the new service"
sudo systemctl daemon-reload

echo -e "Enabeling the new services consulN1"
sudo systemctl enable consulN2

echo -e "Enabeling the new services instance_con_1"
sudo systemctl enable instance_con_1

echo -e "Enabeling the new services consulN1"
sudo systemctl enable instance_con_2

echo -e "Initializing the Consul Service"
sudo systemctl start consulN2

echo -e "Checking Consul status"
sudo systemctl status consulN2

echo -e "Join consul members"
sudo consul join 192.168.100.5
#----------------------------------------------------------------------------------


#------------------ Launching web instances --------------------------
echo -e "Initializing the configuration of web instaces for nodeOne"

echo -e "creating app directory"
sudo mkdir -p "$install_dir"

echo -e "\n\n copying web service file into /home/consul/app/ route"
sudo cp -r /vagrant/Consul_N2/app_index/index.js $install_dir

echo -e "\n\nEntering app path to run the specific commands"
cd "$install_dir"

echo -e "\n\nInstalling npm Consul"
sudo npm install consul

echo -e "\n\nInstalling npm express"
sudo npm install express

echo -e "\n\nLunching web Instance 1 in nodeOne"
sudo systemctl start instance_con_1

echo -e "\n\nLunching web Instance 2 in nodeOne"
sudo systemctl start instance_con_2

#----------------------------------------------------------------------------

























