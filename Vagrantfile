#SRV-JENKINS
# => Configuração para servidor jenkins-ci
# => Requisitos:
# => vagrant plugin install vagrant-librarian-puppet
#


VAGRANTFILE_API_VERSION	= "2"
GUEST_IP				= "192.168.2.11"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	config.librarian_puppet.puppetfile_dir	= "librarian"
	config.vm.box = "puppetlabs/centos-7.0-64-puppet"
	config.vm.define :jenkins_ci do |jenkins| 

		jenkins.vm.hostname = "jenkins-ci"

		jenkins.vm.provider "virtualbox" do |jenkins_vb| 
			jenkins_vb.memory = "1024"
		end

		jenkins.vm.provision "puppet" do |puppet|
			puppet.module_path		= ["modules","librarian/modules"]
			puppet.manifest_file	= "ci.pp"
		end

		jenkins.vm.network :private_network, ip: GUEST_IP
		jenkins.vm.network "forwarded_port", guest:8080, host: 9090, auto_correct: true

	end

end
