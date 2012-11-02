
define installservices::amberserver($source) {

      file { "/opt/$source":
             ensure => present,
             source => "puppet:///modules/installservices/$source"
         }


        exec { "cp /opt/amberserver":
		command  => "sudo cp /opt/$source /etc/init/$source",
		cwd      => "/opt/amber",
		path     => "/usr/bin:/usr/sbin:/bin",
		before   => Exec["chmod amber"],
		require   => Class["amber"]
	}

	exec { "chmod amber":
		command  => "chmod a+x /etc/init/$source",
		cwd      => "/opt/amber",
		path     => "/usr/bin:/usr/sbin:/bin",
		before   => Exec["start ambernode service"]
	}

        exec { "start ambernode service":
		command  => "sudo start amberserver",
		cwd      => "/opt/amber",
		path     => "/usr/bin:/usr/sbin:/bin"
	}


}