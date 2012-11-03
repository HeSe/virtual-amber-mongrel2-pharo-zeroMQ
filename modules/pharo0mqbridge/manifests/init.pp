class pharo0mqbridge {
	include pharo

         file { "/opt/installPharo0MQBridgeScript.st":
             ensure => present,
             source => "puppet:///modules/pharo0mqbridge/installPharo0MQBridgeScript.st"
         }

	# get the sources
	exec {"get Pharo0MQBridge":
               path => ["/bin", "/usr/bin", "/usr/local/bin"],
               cwd => "/opt",
               command  => "git clone git://github.com/HeSe/pharo-zeroMQWebBridge.git ",
	       creates => "/opt/pharo-zeroMQWebBridge",
	       before   => Exec["install Pharo0MQBridge"],  
               require => [Class["pharo"] , Package["git-core"]]
      }


	# install the sources
	exec { "install Pharo0MQBridge":
		command  => "/opt/Pharo-1.4-one-click-headless.sh /opt/installPharo0MQBridgeScript.st ",
		cwd      => "/opt/Pharo-1.4-one-click.app",
		path     => "/usr/bin:/usr/sbin:/bin",
		require => Class["pharo"]
	}

}

