# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "ansible" => {"memory" => "1024", "cpu" => "2", "ip" => "100", "image" => "ubuntu/jammy64"},
  "rocky"   => {"memory" => "512", "cpu" => "2", "ip" => "101", "image" => "rockylinux/9"},
  "debian"  => {"memory" => "512", "cpu" => "2", "ip" => "102", "image" => "debian/bullseye64"},

}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}.homelab.local"
      machine.vm.network "private_network", ip: "10.20.20.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.customize ["modifyvm", :id, "--groups", "/LAB-Ansible"]
      end

      #Executa em todas as VMs
      machine.vm.provision "shell", path: "provision.sh"
      machine.vm.provision "shell", inline: "hostnamectl set-hostname #{name}.homelab.local"

      #Instala Ansible apenas na vm ansible
      if "#{name}" == "ansible"
        machine.vm.provision "shell", path: "ansible-install.sh"
      end
      #Prepara as VMs para serem gerenciadas pela VM Ansible
      if "#{name}" != "ansible"
        machine.vm.provision "shell", path: "hosts_init.sh"
      end
    end
  end
end