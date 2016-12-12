# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "mwrock/Windows2012R2"
  config.vm.provision "shell", inline: "reg ADD HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\ /v HideFileExt /t REG_DWORD /d 0 /f"
  config.vm.provision "shell", inline: "reg ADD HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\ /v Hidden /t REG_DWORD /d 1 /f"
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "c:/Users/vagrant/.ssh/id_rsa"
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "c:/Users/vagrant/.ssh/id_rsa.pub"
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "./cookbooks"
    chef.add_recipe "seven_zip"
    chef.add_recipe "visualstudio"
    chef.add_recipe "resharper"
    chef.add_recipe "notepadpp"
    chef.add_recipe "chrome"
    chef.add_recipe "git"
    chef.add_recipe "beyondcompare"
    chef.add_recipe "fiddler"
    chef.add_recipe "chocolatey-installer"
    chef.json = {
      "chocolatey-installer" => {
        "packages" => ["tortoisesvn"]
      }
    }
  end
end
