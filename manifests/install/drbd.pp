# == Class ganeti::install::hypervisor
#
# This class is called from ganeti for installing the hypervisor.
#
class ganeti::install::drbd {
  
  package { $ganeti::packages_drbd:
    ensure => present,
  }
}
