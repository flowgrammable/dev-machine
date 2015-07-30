# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  # Source machine.
  config.vm.define "source" do |source|
    source.vm.box = "cchojnacki/arch-flogdev"
    source.vm.provision :shell, path: "bootstrap.sh" 
    source.vm.network "private_network", ip: "192.168.20.1", virtualbox__intnet: "sourcenet"
  end

  # 'Device Under Test' machine.
  config.vm.define "dut" do |dut|
    dut.vm.box = "cchojnacki/arch-flogdev"
    dut.vm.provision :shell, path: "bootstrap.sh"
    dut.vm.provision :shell, path: "scripts/install_devtools.sh"
    config.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nicpromisc2","allow-vms"]
      v.customize ["modifyvm", :id, "--nicpromisc3","allow-vms"]
      v.customize ["modifyvm", :id, "--nic2", "intnet"]
      v.customize ["modifyvm", :id, "--nic3", "intnet"]
      v.customize ["modifyvm", :id, "--intnet2", "sourcenet"]
      v.customize ["modifyvm", :id, "--intnet3", "sinknet"]
    end
  end

  # Sink machine.
  config.vm.define "sink" do |sink|
    sink.vm.box = "cchojnacki/arch-flogdev"
    sink.vm.provision :shell, path: "bootstrap.sh"
    sink.vm.network "private_network", ip: "192.168.20.2", virtualbox__intnet: "sinknet"
  end


  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.

  # Form for sharing a new folder with the VM...
  # config.vm.synced_folder "/host/machine/path", "/guest/machine/path"
  

  # You will need to set the to an additional folder, for example your
  # Freeflow repo directory. 

  # config.vm.synced_folder "/home/michael/code/flogdev/freeflow", "/freeflow"

  # Do ***NOT*** commit this file unless the 
  # change is to a machine, not just setting the shared folder directory.

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end
  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline <<-SHELL
  #   sudo apt-get install apache2
  # SHELL
end
