class jenkins_ci::system {

	if versioncmp($::puppetversion,'3.6.1') >= 0 {
	  Package {
	    allow_virtual => false,
	  }
	}
	
	exec {
		"install-java":
			unless => "/usr/bin/ls /opt/ | /usr/bin/grep jdk ",
			command => "/vagrant/scripts/install-java.sh",
			require => Package["wget"],
	}

	package {['git','maven','links']:
		ensure => installed,
		allow_virtual => false,
	}

}