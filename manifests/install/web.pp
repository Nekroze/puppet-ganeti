# == Class ganeti::install::web
#
# This class is called from ganeti for installing the web manager.
#
class ganeti::install::web {
  
  python::pip { 'twisted':
    ensure   => $ganeti::web_ensure,
  }
  ->
  vcsrepo { "/path/to/repo":
    ensure   => present,
    provider => git,
    source   => 'git://git.osuosl.org/gitolite/ganeti/twisted_vncauthproxy',
  }

  python::pip { 'fabric':
    ensure   => $ganeti::web_ensure,
  }
  ->
  archive { 'ganeti-${ganeti::web_version}':
    ensure   => $ganeti::web_ensure,
    url      => "https://code.osuosl.org/attachments/download/3321/ganeti-webmgr-${ganeti::web_version}.tar.gz",
    checksum => false,
    target   => $ganeti::web_install_dir,
  }
  ->
  exec { 'install-ganeti-web':
    cwd     => "${ganeti::web_install_dir}/ganeti-webmgr-${ganet::web_version}",
    command => "fab deploy \
                && echo \"${ganeti::web_version}\" > /var/log/puppet/ganeti-web-installed-version",
    unless  => "test \"`cat  /var/log/puppet/ganeti-web-installed-version 2>/dev/null`\" = \"${ganeti::web_version}\"",
  }

  if $ganeti::web_ldap {
    if $::osfamily == 'Redhat' {
      $ldap_packages = ['openldap-devel']
      } else {
      $ldap_packages = ['libldap2-dev', 'libsasl2-dev']
    }    
    ensure_packages($ldap_packages, {'ensure' => $ganeti::web_ensure})

    exec { "install-ganeti-ldap-enable":
      cwd       => "${ganeti::web_install_dir}/ganeti-webmgr-${ganet::web_version}",
      command   => "fab ldap \
                    && echo \"${ganeti::web_version}+ldap\" > /var/log/puppet/ganeti-web-installed-version-ldap",
      unless    => "test \"`cat  /var/log/puppet/ganeti-web-installed-version-ldap 2>/dev/null`\" = \"${ganeti::web_version}+ldap\"",
      subscribe => Exec['install-ganeti-web'],
    }
  } else {
    exec { "install-ganeti-ldap-disable":
      cwd       => "${ganeti::web_install_dir}/ganeti-webmgr-${ganet::web_version}",
      command   => 'fab ldap:disable \
                    && rm -f /var/log/puppet/ganeti-web-installed-version-ldap',
      onlyif    => 'test -f /var/log/puppet/ganeti-web-installed-version-ldap',
    }
  }
}
