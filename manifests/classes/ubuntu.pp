class ubuntu {
  exec { "apt-get_update":
    command => "apt-get update",
    refreshonly => true,
  }

  # fix 7376
  package { ["openssl", "openssh-server", "openssh-client", "openssh-blacklist", "ssl-cert" ]:
    ensure => latest,
    require => Exec["apt-get_update"]
  }

  # Default packages
  package {
    "cron": ensure => present;
    "nano": ensure => present;
  }
}

