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
  $ensure            = $ganeti::params::ensure,
  $service_name      = $ganeti::params::service_name,
  $packages_ganeti   = $ganeti::params::packages_ganeti,
  $packages_drbd     = $ganeti::params::packages_drbd,
  $drbd_ensure       = $ganeti::params::drbd_ensure,
  $packages_kvm      = $ganeti::params::packages_kvm,
  $kvm_ensure        = $ganeti::params::kvm_ensure,
  $web_ensure        = $ganeti::params::web_ensure,
  $web_version       = $ganeti::params::web_version,
  $web_install_dir   = $ganeti::params::web_install_dir,
  $web_admins        = $ganeti::params::web_admins,
  $web_database_type = $ganeti::params::web_database_type,
  $web_database_name = $ganeti::params::web_database_name,
  $web_database_user = $ganeti::params::web_database_user,
  $web_database_pass = $ganeti::params::web_database_pass,
  $web_database_host = $ganeti::params::web_database_host,
  $web_database_port = $ganeti::params::web_database_port,
  $web_timezone      = $ganeti::params::web_timezone,
  $web_language      = $ganeti::params::web_language,
  $web_id            = $ganeti::params::web_id,
  $web_name          = $ganeti::params::web_name,
  $web_email_host    = $ganeti::params::web_email_host,
  $web_email_port    = $ganeti::params::web_email_port,
  $web_email_from    = $ganeti::params::web_email_from,
  $web_registration  = $ganeti::params::web_registration,
  $web_api_key       = $ganeti::params::web_api_key,
) inherits ganeti::params {

  validate_string($ensure, $web_ensure, $web_version, $drbd_ensure, $kvm_ensure, $web_database_type, $web_database_name, $web_database_users, $web_database_pass, $web_database_host, $web_timezone, $web_language, $web_name, $web_email_host, $web_email_from, $web_api_key)
  validate_array($packages_ganeti, $packages_drbd, $packages_kvm, $web_admins)
  validate_bool($web_registration)
  validate_bool(is_numeric($web_database_host), is_numeric($web_id), is_numeric($web_email_port)
  validate_absolution_path($web_install_dir)

  class { 'ganeti::install': } ->
  class { 'ganeti::config': } ~>
  class { 'ganeti::service': } ->
  Class['ganeti']
}
