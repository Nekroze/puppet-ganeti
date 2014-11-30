# == Class ganeti::web::config
#
# This class is called from ganeti web manager configuration.
#
class ganeti::config {
  file { 'ganeti-web-settings':
    ensure  => $ganeti::web_ensure,
    require => Class['ganeti::install::web']
    path    => "${ganeti::web_install_dir}/ganeti-webmgr-${ganet::web_version}/settings.py",
    content => template('ganeti/ganeti-web-settings.py.erb')
  }
}
