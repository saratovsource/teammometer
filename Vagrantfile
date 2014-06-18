# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] = "parallels"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.forward_agent = true
  config.vm.synced_folder ".", "/team_mometer", nfs: true
  config.vm.box = "parallels/boot2docker"

  config.vm.define 'team' do |node|
    node.vm.network :private_network, ip: '192.168.50.11'
  end

  config.vm.provider "parallels" do |v|
    v.memory = 1024
    #v.cpus = 2
  end

  config.vm.provision :docker do |d|
    # Ruby bundles dir
    d.run "bundles",
      image: "busybox",
      cmd: "/bin/true",
      args: "-v /bundles -v ~/.ssh"

    # Postgres database data dir
    d.run "postgresql_data",
      image: "busybox",
      cmd: "/bin/true",
      args: "-v /data"

    d.run "postgresql",
      image: "paintedfox/postgresql",
      args: "-p 127.0.0.1:5432:5432 -e USER=docker -e PASS=docker -e DB=test --volumes-from postgresql_data"

    # d.build_image "/team_mometer/provisioning", args: "--rm -t team"

  end

  # config.vm.provision "ansible" do |ansible|
  #   ansible.playbook = "provisioning/site.yml"
  #   ansible.verbose = "vv"
  # end

  # # for vagrant-exec plugin
  # config.exec.root = "/vagrant"
  # config.exec.prepend_with "bundle exec", only: %w(rake rspec guard rails unicorn)

  # # vagrant hostmanager
  # config.hostmanager.enabled = true
  # config.hostmanager.manage_host = true
  # config.hostmanager.include_offline = true
end
