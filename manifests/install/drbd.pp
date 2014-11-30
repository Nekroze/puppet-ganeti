# == Class ganeti::install:drbd
#
# This class is called from ganeti for installing the drbd requirements.
#
class ganeti::install::drbd {
 
  ensure_packages($ganeti::packages_drbd, {'ensure' => $ganeti::drbd_ensure})
}
