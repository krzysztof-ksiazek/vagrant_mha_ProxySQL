Vagrant.configure(2) do |config|

    config.ssh.insert_key = false

    config.vm.define "cmon" do |cmon|
        cmon.vm.box = "ubuntu/trusty64"
        cmon.vm.network "private_network", type: "dhcp"
        cmon.vm.provider "virtualbox" do |vb|
            vb.memory = "1024"
        end
    end

    config.vm.define "master" do |master|
        master.vm.box = "ubuntu/trusty64"
        master.vm.network "private_network", type: "dhcp"
        master.vm.provider "virtualbox" do |vb|
            vb.memory = "1024"
        end
    end

    config.vm.define "slave" do |slave|
        slave.vm.box = "ubuntu/trusty64"
        slave.vm.network "private_network", type: "dhcp"
        slave.vm.provider "virtualbox" do |vb|
            vb.memory = "1024"
        end
        slave.vm.provision "ansible" do |ansible|
            ansible.playbook="replication-cc.yml"
            ansible.groups = {
                "db" => ["master", "slave"],
                "all" => ["cmon", "master", "slave"]
            }
            ansible.limit = 'all'
        end
    end

end


