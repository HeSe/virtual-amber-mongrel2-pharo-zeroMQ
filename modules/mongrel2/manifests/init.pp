class mongrel2 {
	include apt
	include sqlite3
	include zeromq

	# get the source tarball from the zeroms download site
	exec { "mongrel2-source":
	         path => ["/bin", "/usr/bin", "/usr/local/bin"],
                 cwd => "/opt/",
                 command => "git clone git://github.com/zedshaw/mongrel2.git",
                 creates => "/opt/mongrel2",
                 before  => Exec["install-mongrel2"],
                 require => [Class["amber"], Package["git-core"]]
	}


	# install
	exec { "make all install":
		alias    => "install-mongrel2",
		cwd      => "/opt/mongrel2",
		path     => "/usr/bin:/usr/sbin:/bin",
                before   => Exec["make logs path"]
	}

	# install logs
	exec { "mkdir logs":
		alias    => "make logs path",
		cwd      => "/opt/mongrel2",
		path     => "/usr/bin:/usr/sbin:/bin",
                before   => Exec["make tmp path"]
	}
	# install tmp
	exec { "mkdir tmp":
		alias    => "make tmp path",
		cwd      => "/opt/mongrel2",
		path     => "/usr/bin:/usr/sbin:/bin",
                before   => Exec["make locks path"]
	}
	# install locks
	exec { "mkdir locks":
		alias    => "make locks path",
		cwd      => "/opt/mongrel2",
		path     => "/usr/bin:/usr/sbin:/bin",
                before   => Exec["make run path"]
	}
        
        # install run
	exec { "mkdir run":
		alias    => "make run path",
		cwd      => "/opt/mongrel2",
		path     => "/usr/bin:/usr/sbin:/bin"
	}
}
