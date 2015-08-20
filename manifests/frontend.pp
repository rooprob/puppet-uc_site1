# Class: uc_site1::frontend
# ===========================
#
# configure frontend services
#
# Parameters
# ----------
#
#
class uc_site1::frontend () {
  # validate parameters here

  class{ '::apache': }

  apache::vhost{ "${::uc_site1::site_name} no-ssl":
    docroot    => "/var/www/htdocs/${::uc_site1::site_name}",
    servername => $::uc_site1::site_name,
    port       => 80,
  }
  apache::vhost{ "${::uc_site1::site_name} ssl":
    docroot    => "/var/www/securedocs/${::uc_site1::site_name}",
    servername => $::uc_site1::site_name,
    port       => 443,
  }
}
