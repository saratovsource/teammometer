# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] = "parallels"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.forward_agent = true
  config.vm.synced_folder ".", "/vagrant", nfs: true
  config.vm.box = "parallels/boot2docker"

  config.vm.define 'team' do |node|
    node.vm.network :private_network, ip: '192.168.50.11'
  end

  config.vm.provider "parallels" do |v|
    v.memory = 1024
    #v.cpus = 2
  end

  config.vm.provider "parallels" do |v|
    v.memory = 1048
  end

  # Fix busybox/udhcpc issue
  config.vm.provision :shell do |s|
    s.inline = <<-EOT
      if ! grep -qs ^nameserver /etc/resolv.conf; then
        sudo /sbin/udhcpc
      fi
      cat /etc/resolv.conf
    EOT
  end

  config.vm.provision :ansible do |a|
    a.playbook = "provisioning/vagrant.yml"
    #a.verbose = "vvvv"
  end
end
