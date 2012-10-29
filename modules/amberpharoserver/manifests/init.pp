class amberpharoserver {

    exec {
        "get_amber_pharo_server":
            path => ["/bin", "/usr/bin", "/usr/local/bin"],
            cwd => "/opt",
            command => "git clone https://github.com/dalehenrich/amber-server.git",
            creates => "/opt/repository/amber-server",
            require => [[Class['pharo'], Package["git-core"]]
    }

}

