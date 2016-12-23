# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "mwrock/Windows2012R2"

  # Copy over SSH keys
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "c:/Users/vagrant/.ssh/id_rsa"
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "c:/Users/vagrant/.ssh/id_rsa.pub"

  # Up the RAM to something usable
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  # Provision dev tools
  config.vm.provision "shell", inline: "cmd /c powershell.exe -File c:/vagrant/provision.ps1"
end
