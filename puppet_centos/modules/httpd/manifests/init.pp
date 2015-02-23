# Manage httpd server

class httpd {
  package { 'httpd':
    ensure => installed,
  }
}

