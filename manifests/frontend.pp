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

  file{ ['/var/www/htdocs', '/var/www/securedocs']:
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0755'
  }

  apache::vhost{ "${::uc_site1::site_name} no-ssl":
    docroot    => "/var/www/htdocs/${::uc_site1::site_name}",
    servername => $::uc_site1::site_name,
    port       => 80,
    require    => File['/var/www/htdocs']
  }
  apache::vhost{ "${::uc_site1::site_name} ssl":
    docroot    => "/var/www/securedocs/${::uc_site1::site_name}",
    servername => $::uc_site1::site_name,
    port       => 443,
    require    => File['/var/www/securedocs']
  }
}
