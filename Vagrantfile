Vagrant.configure(2) do |config|
 config.vm.define "vm-1" do |subconfig|
  subconfig.vm.box = "centos/7"
  subconfig.vm.hostname="vm-1"
  subconfig.vm.network :private_network, ip: "192.168.50.11"
  subconfig.vm.provider "virtualbox" do |vb|
   vb.memory = "1024"
   vb.cpus = "1"
  end
 end

 config.vm.define "vm-2" do |subconfig|
  subconfig.vm.box = "centos/7"
  subconfig.vm.hostname="vm-2"
  subconfig.vm.network :private_network, ip: "192.168.50.12"
  subconfig.vm.provider "virtualbox" do |vb|
   vb.memory = "1024"
   vb.cpus = "1"
  end
 end
 config.ssh.insert_key = false
  config.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"
end