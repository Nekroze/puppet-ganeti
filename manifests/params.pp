# == Class ganeti::params
#
# This class is meant to be called from ganeti.
# It sets variables according to platform.
#
class ganeti::params {
  $ensure            = 'present',
  if $::osfamily == 'Debian' {
    $packages_ganeti = 'ganeti2'
  } else {
    $packages_ganeti = 'ganeti'
  }
  $service_name      = 'ganeti'
  $packages_drbd     = ['drbd84-utils', 'kmod-drbd84']
  $packages_kvm      = ['qemu-kvm', 'libvirt', 'python-virtinst', 'bridge-utils']
  $web_version       = '0.10.2',
  $web_ensure        = 'present',
  $web_install_dir   = '/usr/src',
}
