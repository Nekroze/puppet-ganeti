# == Class ganeti::web::config
#
# This class is called from ganeti web manager configuration.
#
class ganeti::config {
  file { 'ganeti-web-settings':
    ensure  => $ganeti::web_ensure,
    require => Class['ganeti::install::web']
    path    => "${ganeti::web_install_dir}/ganeti_webmgr/settings.py",
    content => template('ganeti/ganeti-web-settings.py.erb')
  }

  file { 'ganeti-web-wsgi':
    ensure  => $ganeti::web_ensure,
    require => Class['ganeti::install::web']
    path    => "${ganeti::web_install_dir}/ganeti_webmgr/ganeti.wsgi",
    content => template('ganeti/ganeti-web-wsgi.erb')
  }
  ->
  apache::vhost { $ganeti::web_url:
    port                        => '80',
    docroot                     => "${ganeti::web_install_dir}/ganeti_webmgr",
    wsgi_application_group      => '%{GLOBAL}',
    wsgi_daemon_process         => 'wsgi',
    wsgi_daemon_process_options => {
      processes    => '2',
      threads      => '15',
      display-name => '%{GROUP}',
    },
    wsgi_import_script          => "${ganeti::web_install_dir}/ganeti_webmgr/ganeti.wsgi",
    wsgi_import_script_options  => {
      process-group => 'wsgi',
      application-group => '%{GLOBAL}',
    },
    wsgi_process_group          => 'wsgi',
    wsgi_script_aliases         => { '/' => "${ganeti::web_install_dir}/ganeti_webmgr/ganeti.wsgi" },
  }
}
