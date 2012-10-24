class nodejsserver {

     package {
        "python-software-properties":
            ensure => present;

        "nodejs":
            ensure => present,
            require => Exec["install repository"];

         "npm":
            ensure => present,
            require => Exec["install repository"];
       }

     exec {
        "install repository":
            path => ["/bin", "/usr/bin", "/usr/local/bin"],
            command => "add-apt-repository ppa:chris-lea/node.js && apt-get update",
            require => Package["python-software-properties"];
           }


}