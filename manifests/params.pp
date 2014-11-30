# == Class ganeti::params
#
# This class is meant to be called from ganeti.
# It sets variables according to platform.
#
class ganeti::params {
  $ensure             = 'present',
  if $::osfamily == 'Debian' {
    $packages_ganeti     = 'ganeti2'
  } else {
    $packages_ganeti     = 'ganeti'
  }
  $service_name          = 'ganeti'
  $packages_drbd         = ['drbd84-utils', 'kmod-drbd84']
  $drbd_ensure           = 'present',
  $packages_kvm          = ['qemu-kvm', 'libvirt', 'python-virtinst', 'bridge-utils']
  $kvm_ensure            = 'present',
  $web_version           = '0.10.2',
  $web_ensure            = 'present',
  $web_install_dir       = '/usr/src',
  $web_admins            = [],
  $web_database_type     = 'postgresql',
  $web_database_name     = 'ganeti-web',
  $web_database_user     = 'ganeti-web',
  $web_database_pass     = 'ganeti-web',
  $web_database_host     = 'database',
  $web_database_port     = 5432,
  $web_timezone          = 'UTC',
  $web_language          = 'en_US',
  $web_id                = 1,
  $web_name              = 'Ganeti Web Management',
  $web_email_host        = 'mx',
  $web_email_port        = 25,
  $web_email_from        = "noreply@$fqdn",
  $web_registration      = true,
  $web_api_key           = 'CHANGE_ME',
  $web_ldap              = true,
  $web_ldap_uri          = 'ldaps://ldap',
  $web_ldap_bind_dn      = 'read',
  $web_ldap_bind_pass    = 'read',
  $web_ldap_users_dn     = '',
  $web_ldap_users_uid    = 'uid',
  $web_ldap_groups_dn    = '',
  $web_ldap_groups_class = 'groupOfNames',
}
