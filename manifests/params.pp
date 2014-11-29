# == Class ganeti::params
#
# This class is meant to be called from ganeti.
# It sets variables according to platform.
#
class ganeti::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'ganeti2'
    }
    default: {
      $package_name = 'ganeti'
    }
  }
  $service_name = 'ganeti'
}
