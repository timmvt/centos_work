# From Instant Puppet 3 Starter book

node default {
  package { 'puppet':
    ensure => latest,
    notify => Service['puppet'],
  }
  service { 'puppet':
    ensure => running,
    enable => true,
  }
}

node puppetserver inherits default {
  package { 'puppet-server':
    ensure => latest,
    notify => Service['puppetmaster'],
  }
  service { 'puppetmaster':
    ensure    => running,
    enable    => true,
    subscribe => Package['puppet-server']
  }

}

  

