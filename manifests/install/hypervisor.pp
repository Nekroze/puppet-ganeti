# == Class ganeti::install::hypervisor
#
# This class is called from ganeti for installing the hypervisor.
#
class ganeti::install::hypervisor {
  ensure_packages($ganeti::packages_kvm, {'ensure' => $ganeti::kvm_ensure})
}
