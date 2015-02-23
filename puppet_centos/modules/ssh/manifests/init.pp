# Manages the SSH service

class ssh {
  service { 'ssh':
    ensure => running,
  }
}

