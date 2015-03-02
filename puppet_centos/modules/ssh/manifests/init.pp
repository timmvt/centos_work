# Manages the SSH service

class ssh {
  service { 'sshd':
    ensure => running,
  }
}

