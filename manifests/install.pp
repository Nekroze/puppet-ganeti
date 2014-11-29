# == Class ganeti::install
#
# This class is called from ganeti for install.
#
class ganeti::install {

  package { $::ganeti::package_name:
    ensure => present,
  }
}
