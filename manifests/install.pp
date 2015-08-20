# == Class uc_site1::install
#
# This class is called from uc_site1 for install.
#
class uc_site1::install {

  package { $::uc_site1::package_name:
    ensure => present,
  }
}
