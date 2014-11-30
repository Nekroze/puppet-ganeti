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
  $ensure                = $ganeti::params::ensure,
  $services              = $ganeti::params::services,
  $enable                = $ganeti::params::enable,
  $service_name          = $ganeti::params::service_name,
  $packages_ganeti       = $ganeti::params::packages_ganeti,
  $packages_drbd         = $ganeti::params::packages_drbd,
  $drbd_ensure           = $ganeti::params::drbd_ensure,
  $packages_kvm          = $ganeti::params::packages_kvm,
  $kvm_ensure            = $ganeti::params::kvm_ensure,
  $manage_firewall       = $ganeti::params::manage_firewall,
  $web_url               = $ganeti::params::web_url,
  $web_ensure            = $ganeti::params::web_ensure,
  $web_services          = $ganeti::params::web_services,
  $web_enable            = $ganeti::params::web_enable,
  $web_version           = $ganeti::params::web_version,
  $web_install_dir       = $ganeti::params::web_install_dir,
  $web_admins            = $ganeti::params::web_admins,
  $web_database_type     = $ganeti::params::web_database_type,
  $web_database_name     = $ganeti::params::web_database_name,
  $web_database_user     = $ganeti::params::web_database_user,
  $web_database_pass     = $ganeti::params::web_database_pass,
  $web_database_host     = $ganeti::params::web_database_host,
  $web_database_port     = $ganeti::params::web_database_port,
  $web_timezone          = $ganeti::params::web_timezone,
  $web_language          = $ganeti::params::web_language,
  $web_id                = $ganeti::params::web_id,
  $web_name              = $ganeti::params::web_name,
  $web_email_host        = $ganeti::params::web_email_host,
  $web_email_port        = $ganeti::params::web_email_port,
  $web_email_from        = $ganeti::params::web_email_from,
  $web_registration      = $ganeti::params::web_registration,
  $web_api_key           = $ganeti::params::web_api_key,
  $web_ldap              = $ganeti::params::web_ldap,
  $web_ldap_uri          = $ganeti::params::web_ldap_uri,
  $web_ldap_bind_dn      = $ganeti::params::web_ldap_bind_dn,
  $web_ldap_bind_pass    = $ganeti::params::web_ldap_bind_pass,
  $web_ldap_users_dn     = $ganeti::params::web_ldap_users_dn,
  $web_ldap_users_uid    = $ganeti::params::web_ldap_users_uid,
  $web_ldap_groups_dn    = $ganeti::params::web_ldap_groups_dn,
  $web_ldap_groups_class = $ganeti::params::web_ldap_groups_class,
) inherits ganeti::params {

  validate_string($ensure, $web_ensure, $web_version, $drbd_ensure, $kvm_ensure, $web_database_type, $web_database_name, $web_database_users, $web_database_pass, $web_database_host, $web_timezone, $web_language, $web_name, $web_email_host, $web_email_from, $web_api_key, $web_ldap_uri, $web_ldap_bind_dn, $web_ldap_bind_pass, $web_lda_users_dn, $web_lda_users_uid, $web_lda_groups_dn, $web_lda_groups_class, $web_url)
  validate_array($packages_ganeti, $packages_drbd, $packages_kvm, $web_admins)
  validate_bool($web_registration, $web_ldap, $enable, $web_enable, $manage_firewall)
  validate_bool(is_numeric($web_database_host), is_numeric($web_id), is_numeric($web_email_port)
  validate_absolution_path($web_install_dir)

  class { 'ganeti::install': } ->
  class { 'ganeti::config': } ~>
  class { 'ganeti::service': } ->
  Class['ganeti']
}
