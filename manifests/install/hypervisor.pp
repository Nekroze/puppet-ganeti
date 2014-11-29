# == Class ganeti::install::hypervisor
#
# This class is called from ganeti for installing the hypervisor.
#
class ganeti::install::hypervisor {
  
  $packages = $ganeti::packages_kvm
  
  package { $packages:
    ensure => "present",
  }
}
