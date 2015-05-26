class jenkins_ci::app {
	
	include jenkins_ci

	if versioncmp($::puppetversion,'3.6.1') >= 0 {
	  Package {
	    allow_virtual => false,
	  }
	}

	class {'jenkins':
		config_hash => {
			'JAVA_ARGS' => {'value'=>'-Xmx256m'}
		},

	}

	$plugins =[
	    'ssh-credentials',
	    'credentials',
	    'scm-api',
	    'git-client',
	    'git',
	    'maven-plugin',
	    'javadoc',
	    'mailer',
	    'greenballs',
	    'ws-cleanup',
	    'parameterized-trigger',
	    'copyartifact'
	]

	jenkins::plugin{$plugins: }

}