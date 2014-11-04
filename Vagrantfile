# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "baremettle/centos-6.5"

  config.vm.provider :libvirt do |libvirt|
    libvirt.storage_pool_name = "ssd"
  end

  config.vm.provision :shell, :path => "scripts/common.sh"
  config.vm.define "server1" do |srv|
      srv.vm.provision :shell, :path => "scripts/ipa-server.sh"
      srv.vm.network "private_network", ip: "192.168.34.34"
      srv.vm.hostname = "ipa-server1.example.com"
  end

  config.vm.define "server2" do |srv|
      srv.vm.provision :shell, :path => "scripts/ipa-replica.sh"
      srv.vm.network "private_network", ip: "192.168.34.35"
      srv.vm.hostname = "ipa-server2.example.com"
  end

#  additional server 
#  config.vm.define "server3" do |srv|
#      srv.vm.provision :shell, :path => "scripts/ipa-server.sh"
#      srv.vm.network "private_network", ip: "192.168.34.36"
#      srv.vm.hostname = "ipa-server3.example.com"
#  end

  [1, 2].each do |i|
#  [1].each do |i|
      config.vm.define "host#{i}" do |host|
          host.vm.provision :shell, :path => "scripts/ipa-client.sh"
          host.vm.network "private_network", ip: "192.168.34.10#{i}"
          host.vm.hostname = "ipa-host#{i}.example.com"
      end
  end

  config.vm.synced_folder '.', '/vagrant', type: 'nfs'
end
