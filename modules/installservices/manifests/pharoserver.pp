
define installservices::pharoserver($source) {

      file { "/opt/pharoserver.conf":
             ensure => present,
             source => "puppet:///modules/installservices/$source"
         }

        exec { "cp /opt/pharoserver.conf":
		command  => "sudo cp /opt/$source /etc/init/$source",
		cwd      => "/opt",
		path     => "/usr/bin:/usr/sbin:/bin",
		before   => Exec["chmod pharoserver.conf"],
		require   => Class["pharo0mqbridge"]
	}

	exec { "chmod pharoserver.conf":
		command  => "chmod a+x /etc/init/$source",
		cwd      => "/opt",
		path     => "/usr/bin:/usr/sbin:/bin",
		before   => Exec["start pharoserver service"]
	}

	 exec { "start pharoserver service":
		command  => "sudo start pharoserver",
		cwd      => "/opt",
		path     => "/usr/bin:/usr/sbin:/bin"
	}


}