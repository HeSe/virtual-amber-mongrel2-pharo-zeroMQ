class installservices {

       	installservices::amberserver { "amberserver.conf":
		source      => "amberserver.conf",
		require     => Class['amber'],

              }
              
        installservices::mongrel2server { "mongrel2.conf":
		source      => "mongrel2.conf",
		require     => Class['mongrel2'],

              }


}