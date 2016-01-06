# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian-8.2"
  config.vm.box_url = "https://github.com/one-love/vagrant-base-box/releases/download/v0.1-alpha/debian-8.2-x86_64.box"
  config.vm.network :private_network, ip: "192.168.33.11"
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provision/site.yml"
    ansible.host_key_checking = false
    ansible.groups = {
        "vagrant" => ["default"],
    }

  end
end
