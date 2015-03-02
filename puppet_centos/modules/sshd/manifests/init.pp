# Manages the SSH service

class ssh {
  service { 'sshd':
    ensure => running,
  }

  file { '/etc/ssh/sshd_config':
    ensure  => file,	# TT ADDED from https://docs.puppetlabs.com/puppet/latest/reference/lang_relationships.html
    mode    => 600,    # TT ADDED from https://docs.puppetlabs.com/puppet/latest/reference/lang_relationships.html
    source  => 'puppet:///modules/ssh/sshd_config',
#    require => Package['openssh-server'],    # TT ADDED from https://docs.puppetlabs.com/puppet/latest/reference/lang_relationships.html
    notify  => Service['sshd'],
  }

}

