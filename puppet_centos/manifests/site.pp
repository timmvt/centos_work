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
  file { '/tmp/hosts':
    ensure => file,
    owner  => nobody,
    group  => nobody,
    mode   => 0444,
    force  => false,
    source => 'puppet:///files/hosts',
  }
  file { '/tmp/hosts.linked':
    ensure => link,
    target => '/tmp/hosts',
  }
  file { '/tmp/puppet-files':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => 0444,
    recurse => true,
    source  => 'puppet:///files',
  }
  cron { 'clean-up reports':
    ensure  => present,
    command => 'find /var/lib/puppet-server/reports -type f -name \* .yaml -mtime +21 -delete',
    user    => puppet,
    weekday => 0,
    hour    => 2,
    minute  => 11,
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

  

