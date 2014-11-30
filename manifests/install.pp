# == Class ganeti::install
#
# This class is called from ganeti for install.
#
class ganeti::install {

  if $::osfamily == 'Redhat' {
    include yum::repo::epel
    include yum::repo::elrepo
    yum::managed_yumrepo { 'integ-ganeti':
      descr          => 'Iteg Ganeti repository',
      baseurl        => "http://jfut.integ.jp/linux/ganeti/\$releasever/\$basearch",
      enabled        => 1,
      gpgcheck       => 1,
      failovermethod => 'priority',
      priority       => 5,
    }
  }
  
  class { 'ganeti::install::drbd': }
  class { 'ganeti::install::hypervisor': }
  class { 'ganeti::install::web': }
  
  ensure_packages($ganeti::packages_ganeti, {'ensure' => $ganeti::ensure})
}
