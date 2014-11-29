# == Class ganeti::params
#
# This class is meant to be called from ganeti.
# It sets variables according to platform.
#
class ganeti::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'ganeti'
      $service_name = 'ganeti'
    }
    'RedHat', 'Amazon': {
      $package_name = 'ganeti'
      $service_name = 'ganeti'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
