import "classes/*.pp"
import "definitions/*.pp"

class os {

  file { "/tmp":
    ensure => directory,
    mode   => 1777,
    owner  => root,
    group  => root
  }

  case $operatingsystem {
    debian: {
      case $lsbdistcodename {
        squeeze: { 
          include os::debian-squeeze
        }
        lenny: {
          include os::debian-lenny
        }

        default: {
          fail "Unsupported Debian version '${lsbdistcodename}' in 'os' module"
        }
      }
    }

    ubuntu: {
      case $lsbdistcodename {
        lucid: {
          include "os::ubuntu-${lsbdistcodename}"
        }
		
		natty: {
          include "os::ubuntu-${lsbdistcodename}"
        }

		maverick: {
          include "os::ubuntu-${lsbdistcodename}"
        }        
        default: {
          fail "Unsupported Ubuntu version ${lsbdistcodename} in 'os' module"
        }
      }
    }

    CentOS: {
      include os::centos
    }
    default: {
      fail "Unsupported OS ${operatingsystem} in 'os' module"
    }
  }
}
