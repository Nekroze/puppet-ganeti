# == Class ganeti::install::web
#
# This class is called from ganeti for installing the web manager.
#
class ganeti::install::web {

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
  exec { "install-ganeti-web":
    cwd     => $ganeti::web_install_dir,
    command => "fab deploy \
                && echo \"${ganeti::web_version}\" > \"/var/log/puppet/ganeti-web-installed-version\"",
    unless  => "test \"`cat  /var/log/puppet/ganeti-web-installed-version 2>/dev/null`\" = \"${ganeti::web_version}\"",
  }
}
