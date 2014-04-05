# -*- mode: ruby -*-
# vi: set ft=ruby :

# vagrant test boxes for the linuxwochen2014 presentation
# you just have to change the uri for the boxes to download

Vagrant.configure("2") do |config|

  config.vm.define "master", primary: true do |master|
    master.vm.box = "vagrant-sl64-puppet"
    master.vm.hostname = 'master'

    # you need to change this!
    master.vm.box_url = "http://infra.oss.lan.at/vagrant/vagrant-sl64-puppet.box"
    master.vm.network "private_network", ip: "192.168.1.2", virtualbox__intnet: true

    master.vm.provision :puppet do |puppet|
      puppet.manifest_file  = "master.pp"
      puppet.manifests_path = "vagrant/puppet/manifests"
      puppet.module_path = "vagrant/puppet/modules"
    end
  end

  config.vm.define "sl6agent" do |sl6client|
    sl6client.vm.box = "vagrant-sl64-puppet"
    sl6client.vm.hostname = 'sl6agent'

    # you need to change this!
    sl6client.vm.box_url = "http://infra.oss.lan.at/vagrant/vagrant-sl64-puppet.box"
    sl6client.vm.network :private_network, ip: "192.168.1.3", virtualbox__intnet: true

    sl6client.vm.provision :puppet do |puppet|
      puppet.manifest_file  = "agent.pp"
      puppet.manifests_path = "vagrant/puppet/manifests"
      puppet.module_path = "vagrant/puppet/modules"
    end
  end

  config.vm.define "sol10agent" do |sol10|
    sol10.vm.box = "vagrant-sol10-puppet"
    sol10.vm.hostname = 'sol10agent'

    # you need to change this!
    sol10.vm.box_url = "http://infra.oss.lan.at/vagrant/vagrant-sol10-puppet.box"
    sol10.vm.network :private_network, ip: "192.168.1.4", virtualbox__intnet: true

    sol10.vm.provision :puppet do |puppet|
      puppet.manifest_file  = "agent.pp"
      puppet.manifests_path = "vagrant/puppet/manifests"
      puppet.module_path = "vagrant/puppet/modules"
    end
  end
end
