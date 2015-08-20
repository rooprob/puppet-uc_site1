# Class: uc_site1
# ===========================
#
# Full description of class uc_site1 here.
#
# Parameters
# ----------
#
# * `site_name`
#   frontend site name
#
class uc_site1 (
  $site_name      = $::uc_site1::params::site_name,
  $db_root_passwd = $::uc_site1::params::db_root_passwd,
  $db_options     = $::uc_site1::params::db_options,

) inherits ::uc_site1::params {

  # validate parameters here

  include ::uc_site1::frontend
  include ::uc_site1::database
  include ::uc_site1::maintenance
}
