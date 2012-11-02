
define installservices::mongrel2server($source) {

      file { "/opt/mongrel2.conf":
             ensure => present,
             source => "puppet:///modules/installservices/$source"
         }

      file { "/opt/ambermongrel2pharo.conf":
             ensure => present,
             source => "puppet:///modules/installservices/ambermongrel2pharo.conf"
         }


        exec { "cp /opt/mongrel2.conf":
		command  => "sudo cp /opt/$source /etc/init/$source",
		cwd      => "/opt",
		path     => "/usr/bin:/usr/sbin:/bin",
		before   => Exec["chmod mongrel2.conf"],
		require   => Class["mongrel2"]
	}

	exec { "chmod mongrel2.conf":
		command  => "chmod a+x /etc/init/$source",
		cwd      => "/opt",
		path     => "/usr/bin:/usr/sbin:/bin",
		before   => Exec["load mongrel2 config"]
	}


	exec { "load mongrel2 config":
		command  => "sudo m2sh load -db /opt/mongrel2/config.sqlite -config /opt/ambermongrel2pharo.conf",
		cwd      => "/opt/mongrel2",
		path     => "/usr/bin:/usr/sbin:/bin:/opt/mongrel2/tools",
		require   => Class["mongrel2"],
		before   => Exec["start mongrel2 service"]
	}
	
	 exec { "start mongrel2 service":
		command  => "sudo start mongrel2",
		cwd      => "/opt",
		path     => "/usr/bin:/usr/sbin:/bin"
	}


}