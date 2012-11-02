class pharo0mqbridge {
	include pharo

         file { "/opt/installPharo0MQBridgeScript.st":
             ensure => present,
             source => "puppet:///modules/pharo0mqbridge/installPharo0MQBridgeScript.st"
         }


         file { "/opt/pharozmqwebbridge":
             ensure => directory,
             source => "puppet:///modules/pharo0mqbridge/pharozmqwebbridge/",
             recurse => true,
         }


	# install the authors name
	exec { "install Pharo0MQBridge":
		command  => "/opt/Pharo-1.4-one-click-headless.sh /opt/installPharo0MQBridgeScript.st ",
		cwd      => "/opt/Pharo-1.4-one-click.app",
		path     => "/usr/bin:/usr/sbin:/bin",
		require => Class["pharo"]
	}

}

