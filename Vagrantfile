VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  hostname = "puppet-n01.workstation.localdomain"
  config.vm.define hostname do |node_config|
    node_config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210-nocm.box"
    node_config.vm.box = "centos-min"
    node_config.vm.host_name = hostname
    config.vm.network "private_network", ip: "192.168.101.2"
    memory =  3000;

    node_config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", memory.to_s]
      vb.customize ["modifyvm", :id, "--name", hostname]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
  end

  ENV['PYTHONIOENCODING'] = "utf-8"

  config.vm.provision "ansible" do |ansible|
    ansible.limit = 'all'
    ansible.verbose  = "vvvv"
    ansible.playbook = "master/playbook-master.yml"
    ansible.inventory_path = "master/hosts"
    ansible.extra_vars = { SERVICE_TIER: "test" }
  end

end
