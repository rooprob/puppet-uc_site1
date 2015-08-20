# == Class uc_site1::params
#
# This class is meant to be called from uc_site1.
# It sets variables according to platform.
#
class uc_site1::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'uc_site1'
      $service_name = 'uc_site1'
    }
    'RedHat', 'Amazon': {
      $package_name = 'uc_site1'
      $service_name = 'uc_site1'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
