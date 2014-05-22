# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.forward_agent = true

  config.vm.box = "parallels/ubuntu-12.04"
  config.vm.synced_folder ".", "/vagrant", nfs: true
  # config.vm.synced_folder ".", "/vagrant", type: 'rsync',
  #   rsync__exclude: ".git/"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/site.yml"
    ansible.verbose = "vv"
  end

  # for vagrant-exec plugin
  config.exec.commands %w(rake rspec guard rails unicorn), prepend: "bundle exec", directory: "/vagrant"

  # vagrant hostmanager
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.include_offline = true
  config.vm.define 'team' do |node|
    node.vm.network :private_network, ip: '192.168.50.11'
  end
end
