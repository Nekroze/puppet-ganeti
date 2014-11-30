# == Class ganeti::service
#
# This class is meant to be called from ganeti.
# It ensure the service is running.
#
class ganeti::service {

  service { $ganeti::service_name:
    ensure     => $ganeti::services,
    enable     => $ganeti::enable,
    hasstatus  => true,
    hasrestart => true,
  }

  service { 'vncap':
    ensure    => $ganeti::web_services,
    enable    => $ganeti::web_enable,
    start     => "cd ${ganeti::web_install_dir}/vncap && twistd --pidfile=/tmp/proxy.pid -n vncap"
    subscribe => Vcsrepo["${ganeti::web_install_dir}/vncap"]
  }
  
  service { 'vncap-policy':
    ensure    => $ganeti::web_services,
    enable    => $ganeti::web_enable,
    start     => "cd ${ganeti::web_install_dir}/vncap && twistd --pidfile=/tmp/policy.pid -n flashpolicy"
    subscribe => Vcsrepo["${ganeti::web_install_dir}/vncap"]
  }
}
