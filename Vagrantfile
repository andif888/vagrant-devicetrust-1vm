# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.2"

Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v, override|
        v.gui = true
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--cpus", 2]
        v.customize ["modifyvm", :id, "--vram", 128]
        v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        v.customize ["setextradata", "global", "GUI/SuppressMessages", "all" ]
    end

   

    #
    # Remote Desktop Session Host
    #

    config.vm.define "rdsh" do |rdsh| 
      rdsh.vm.box = "gusztavvargadr/windows-server"
      # rdsh.vm.box = "StefanScherer/windows_2019"
      # rdsh.vm.box = "peru/windows-server-2019-datacenter-x64-eval"
      rdsh.vm.communicator = "winrm"

      # Admin user name and password
      rdsh.winrm.username = "vagrant"
      rdsh.winrm.password = "vagrant"

      rdsh.vm.guest = :windows
      rdsh.windows.halt_timeout = 15

      rdsh.vm.network :forwarded_port, guest: 3389, host: 3390, id: "rdp", auto_correct: true

      rdsh.vm.network "private_network", ip: "192.168.123.3",
        virtualbox__intnet: true

      rdsh.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 3072]
        vb.customize ["modifyvm", :id, "--cpus", 3]
      end

      rdsh.vm.provision "shell",
        name: "enable-winrm-for-ansible",
        path: "scripts/enable-winrm-for-ansible.ps1"

    end

  



    #
    # Controller Machine for Ansible
    #

    config.vm.define "ctrl" do |ctrl|
      ctrl.vm.box = "ubuntu/xenial64"

      ctrl.vm.network :forwarded_port, guest: 22, host: 1122, id: "ssh"

      ctrl.vm.network "private_network", virtualbox__intnet: true, ip: "192.168.123.99"

      ctrl.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 2048]
        vb.customize ["modifyvm", :id, "--cpus", 1]
      end

      ctrl.vm.provision "copy_scripts", type: "file", source: "./scripts", destination: "/tmp/scripts"   

      ctrl.vm.provision "shell_prepare_controller", type: "shell", inline: <<-SHELL
        chmod +x /tmp/scripts/prepare_controller.sh
        /tmp/scripts/prepare_controller.sh
        rsync -a /vagrant/ansible/ /tmp/ansible/
      SHELL

      ctrl.vm.provision "shell_download_ansible_roles", type: "shell", inline: <<-SHELL
        ansible-galaxy install -v -r /tmp/ansible/requirements.yml -p /tmp/ansible/roles/
      SHELL

      ctrl.vm.provision "shell_run_ansible_playbook", type: "shell", inline: <<-SHELL
        cd /tmp/ansible
        ansible-playbook site.yml --inventory-file=inventory
      SHELL

    end


end
