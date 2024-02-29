# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  if Vagrant.has_plugin? "vagrant-vbguest"
    config.vbguest.no_install  = true
    config.vbguest.auto_update = false
    config.vbguest.no_remote   = true
  end  
  
  # Nodo 1 
  config.vm.define :nodeOne do |nodeOne|  
    nodeOne.vm.box = "bento/ubuntu-22.04"
    nodeOne.vm.network :private_network, ip: "192.168.100.5"
    nodeOne.vm.hostname = "nodeOne"
    nodeOne.vm.provision "shell", path: "Consul_N1/provisionN1.sh"	
  end
  
  # Nodo 2 
  config.vm.define :nodeTwo do |nodeTwo|  
    nodeTwo.vm.box = "bento/ubuntu-22.04"
    nodeTwo.vm.network :private_network, ip: "192.168.100.6"
    nodeTwo.vm.hostname = "nodeTwo"
    nodeTwo.vm.provision "shell", path: "Consul_N2/provisionN2.sh", run: "always"	
  end
  
  # Haproxy 
  config.vm.define :haproxy do |haproxy|  
    haproxy.vm.box = "bento/ubuntu-22.04"
    haproxy.vm.network :private_network, ip: "192.168.100.7"
    haproxy.vm.hostname = "haproxy"
    haproxy.vm.provision "shell", path: "Haproxy/provisonHa.sh", run: "always"
  end
  
end
