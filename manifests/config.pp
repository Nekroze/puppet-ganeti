# == Class ganeti::config
#
# This class is called from ganeti for service config.
#
class ganeti::config {
  if $ganeti::web_ensure == 'present' {
    class { 'ganeti::web::config': }
  }
}
