class jenkins_ci {

	include epel

	class {
		'yum_cron':
			check_only => 'yes',
	}

}