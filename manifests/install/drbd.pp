# == Class ganeti::install:drbd
#
# This class is called from ganeti for installing the drbd requirements.
#
class ganeti::install::drbd {
  
  package { $ganeti::packages_drbd:
    ensure => 'present',
  }
}
