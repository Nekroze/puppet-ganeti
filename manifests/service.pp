# == Class ganeti::service
#
# This class is meant to be called from ganeti.
# It ensure the service is running.
#
class ganeti::service {

  service { $::ganeti::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
