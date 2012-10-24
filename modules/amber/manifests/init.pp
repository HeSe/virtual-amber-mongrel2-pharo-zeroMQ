class amber {
    include nodejsserver

    exec {
        "get_amber":
            path => ["/bin", "/usr/bin", "/usr/local/bin"],
            cwd => "/opt",
            command => "git clone git://github.com/NicolasPetton/amber.git",
            creates => "/opt/amber",
            require => Package["git-core", "nodejs", "npm"]
    }

}

