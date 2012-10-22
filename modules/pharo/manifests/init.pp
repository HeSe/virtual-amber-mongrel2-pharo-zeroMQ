class pharo {
	include uuid
	include wget
        include unzip

	$version = "1.4"
	
	file { "/opt/installFiletreeScript.st":
             ensure => present,
             source => "puppet:///modules/pharo/installFiletreeScript.st"
         }


         file { "/opt/installRFBScript.st":
             ensure => present,
             source => "puppet:///modules/pharo/installRFBScript.st"
         }
         
         file { "/opt/installZeroMQScript.st":
             ensure => present,
             source => "puppet:///modules/pharo/installZeroMQScript.st"
         }
         
         file { "/opt/installScript.st":
             ensure => present,
             source => "puppet:///modules/pharo/installScript.st"
         }

         file { "/opt/Pharo-1.4-one-click-headless.sh":
             ensure => present,
             source => "puppet:///modules/pharo/Pharo-1.4-one-click-headless.sh"
         }

	# get the source tarball from the zeroms download site
	wget::fetch { "pharo-one-click.zip":
		source      => "http://gforge.inria.fr/frs/download.php/31258/Pharo-1.4-14557-OneClick.zip",
		destination => "/tmp/Pharo-1.4-14557-OneClick.zip",
		before      => Exec["unzip-pharo-source"],
		require     => Package['wget'],
	}

	# make sure the tar ball exist then extract it
	exec { "unzip-pharo-source":
		command  => "unzip /tmp/Pharo-1.4-14557-OneClick.zip -d /opt",
		cwd      => "/opt/",
		path     => "/usr/bin:/usr/sbin:/bin",
		before    => Exec["install author"],
		creates  => "/opt/Pharo-1.4-one-click.app",
	}
           
	# install the authors name
	exec { "install author":
		command  => "/opt/Pharo-1.4-one-click-headless.sh /opt/installScript.st ",
		cwd      => "/opt/Pharo-1.4-one-click.app",
		before   => Exec["install filetree"],
		path     => "/usr/bin:/usr/sbin:/bin",
	}

	# install git filetree support
	exec { "install filetree":
		command  => "/opt/Pharo-1.4-one-click-headless.sh /opt/installFiletreeScript.st ",
		cwd      => "/opt/Pharo-1.4-one-click.app",
		before   => Exec["install RFB"],
		path     => "/usr/bin:/usr/sbin:/bin",
	}

        # isntall RFB
	exec { "install RFB":
		command  => "/opt/Pharo-1.4-one-click-headless.sh /opt/installRFBScript.st ",
		cwd      => "/opt/Pharo-1.4-one-click.app",
		before   => Exec["install ZeroMQ"],
		path     => "/usr/bin:/usr/sbin:/bin",

	}

        # install ZeroMQ
	exec { "install ZeroMQ":
		command  => "/opt/Pharo-1.4-one-click-headless.sh /opt/installZeroMQScript.st ",
		cwd      => "/opt/Pharo-1.4-one-click.app/",
		path     => "/usr/bin:/usr/sbin:/bin",
	}


}

