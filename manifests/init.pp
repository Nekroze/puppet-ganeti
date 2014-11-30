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
  $service_name    = $ganeti::params::service_name,
  $packages_ganeti = $ganeti::params::packages_ganeti,
  $packages_drbd   = $ganeti::params::packages_drbd,
  $packages_kvm    = $ganeti::params::packages_kvm,
  $web_ensure      = $ganeti::params::web_ensure,
  $web_version     = $ganeti::params::web_version,
  $web_install_dir = $ganeti::params::web_install_dir,
) inherits ganeti::params {

  validate_string($ensure, $web_ensure, $web_version)
  validate_array($packages_ganeti, $packages_drbd, $packages_kvm)
  validate_absolution_path($web_install_dir)

  class { 'ganeti::install': } ->
  class { 'ganeti::config': } ~>
  class { 'ganeti::service': } ->
  Class['ganeti']
}
