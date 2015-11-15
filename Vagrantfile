Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty32"

  config.vm.network "private_network", ip: "192.168.33.202"
  config.vm.network :forwarded_port, guest: 80, host: 8001

  # Provision
  config.vm.provision "shell", inline: "ln -s /vagrant/vendor/adamnicholson/server01 /root/provision"
  config.vm.provision "shell", inline: "/vagrant/vendor/adamnicholson/server01/provision/install_services.sh"

  # Deploy
  config.vm.provision "shell", inline: "rm -R /opt/000-default.com"
  config.vm.provision "shell", inline: "mkdir /opt/adamnicholson.co.uk"
  config.vm.provision "shell", inline: "ln -s /vagrant /opt/adamnicholson.co.uk/current"
  config.vm.provision "shell", inline: "ln -s /opt/adamnicholson.co.uk/current/nginx.conf /opt/adamnicholson.co.uk/nginx.conf"
  config.vm.provision "shell", inline: "sudo service nginx reload"

  config.vm.provider "virtualbox" do |v|
    v.memory = 512
    v.cpus = 1
  end
end
