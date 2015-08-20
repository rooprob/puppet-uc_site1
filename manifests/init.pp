# Class: uc_site1
# ===========================
#
# Full description of class uc_site1 here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class uc_site1 (
  $package_name = $::uc_site1::params::package_name,
  $service_name = $::uc_site1::params::service_name,
) inherits ::uc_site1::params {

  # validate parameters here

  class { '::uc_site1::install': } ->
  class { '::uc_site1::config': } ~>
  class { '::uc_site1::service': } ->
  Class['::uc_site1']
}
