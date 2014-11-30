# == Class: ganeti
#
# Full description of class ganeti here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class ganeti (
  $ensure          = $ganeti::params::ensure,
  $package_name    = $ganeti::params::package_name,
  $service_name    = $ganeti::params::service_name,
  $packages_drbd   = $ganeti::params::packages_drbd,
  $packages_kvm    = $ganeti::params::packages_kvm,
  $web_version     = $ganeti::params::web_version,
  $web_ensure      = $ganeti::params::web_ensure,
  $web_install_dir = $ganeti::params::web_install_dir,
) inherits ganeti::params {

  

  class { 'ganeti::install': } ->
  class { 'ganeti::config': } ~>
  class { 'ganeti::service': } ->
  Class['ganeti']
}
