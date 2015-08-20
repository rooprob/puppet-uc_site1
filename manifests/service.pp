# == Class uc_site1::service
#
# This class is meant to be called from uc_site1.
# It ensure the service is running.
#
class uc_site1::service {

  service { $::uc_site1::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
