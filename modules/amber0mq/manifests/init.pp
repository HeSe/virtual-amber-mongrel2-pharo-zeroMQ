class amber0mq {
    include amber

    exec {
        "get_amber-zeroMQ":
            path => ["/bin", "/usr/bin", "/usr/local/bin"],
            cwd => "/opt/amber/examples",
            command => "git clone https://github.com/HeSe/amber-zeroMQ.git",
            creates => "/opt/amber/examples/amber-zeroMQ/",
            require => [Class["amber"], Package["git-core"]]
    }

}
