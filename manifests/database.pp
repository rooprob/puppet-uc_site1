# Class: uc_site1::database
# ===========================
#
# configure database services
#
# Parameters
# ----------
#
#
class uc_site1::database() {
  # validate parameters here

  class{ '::mysql::client': }
  class{ '::mysql::bindings': }
  class{ '::mysql::server':
    root_password    => $::uc_site1::db_root_passwd,
    override_options => $::uc_site1::db_options,
  }

  mysql::db { 'mydb':
    user     => 'myuser',
    password => 'mypass',
    host     => 'localhost',
    grant    => ['SELECT', 'UPDATE'],
  }

  class { '::mysql_hardening':  provider => 'puppetlabs/mysql'}
}
