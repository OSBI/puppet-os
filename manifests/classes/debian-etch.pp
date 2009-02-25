class os::debian-etch inherits debian {
  file { "/etc/apt/sources.list":
    ensure => absent,
    before => Exec["apt-get_update"],
  }

  file { "/etc/apt/sources.list.d/etch.list":
    mode   => 644,
    source => "puppet:///os/etc/apt/sources.list.d/sources.list-debian-etch",
    before => Exec["apt-get_update"],
  }

  file { "/etc/apt/sources.list.d/c2c.list":
    mode   => 644,
    source => "puppet:///os/etc/apt/sources.list.d/sources.list-c2c-etch",
    before => Exec["apt-get_update"],
  }

  os::apt_key_add { c2c-key:
    source  => "http://dev.camptocamp.com/packages/pub.key",
    keyid   => "5C662D02",
    before  => Exec["apt-get_update"],
  }

  # general config for emacs (without temporary files ~ )
  file { "/etc/emacs/site-start.d/50c2c.el":
    ensure => present,
    mode   => 644,
    source => "puppet:///os/etc/emacs/site-start.d/50c2c.el",
  }

  # Umask, etc.
  file { "/etc/profile":
    ensure => present,
    mode   => 644,
    source => "puppet:///os/etc/profile-etch",
  }

  # Timezone
  file { "/etc/localtime":
    ensure => present,
    source => "file:///usr/share/zoneinfo/Europe/Zurich",
  }

  file { "/etc/timezone":
    ensure  => present,
    content => "Europe/Zurich",
  }

  # Kernel
  file { "/etc/modules":
    ensure => present,
  }
}
