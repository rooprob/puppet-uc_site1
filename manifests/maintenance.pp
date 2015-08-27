# Class: uc_site1::maintenance
# ===========================
#
# configure maintenance services
#
# Parameters
# ----------
#
#
class uc_site1::maintenance () {
  # validate parameters here

  class { '::os_hardening':
    ignore_users => [
      'www-data'
    ]
  }
  class { '::ssh_hardening':
    use_pam => true,
  }
  class { '::os_performance': }
}
