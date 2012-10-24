class buildessentials {

	package { "build-essential":
		ensure  => installed,
	}
	package { "git-core":
		ensure  => installed,
	}
	package { "libssl-dev":
		ensure  => installed,
	}
}