node 'demo' { 
  include httpd
  include sudoers

  cron { 'Back up cat pictures':
    command => '/usr/bin/rsync -az /var/www/cat-pictures/ /cat-pictures-backup/',
    hour    => '04',
    minute  => '00',
  }

  user { 'art':
    ensure     => present,
    comment    => 'Art Vandalay',
    home       => '/home/art',
    managehome => true,
  } 

  ssh_authorized_key { 'art_ssh':
    user => 'art',
    type => 'rsa',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDfx5GiSqEV+VXY/HDJEL/tWoY7RcwGqMnqCJS+eUc8vKQDZ0VcopPJPZDkvnmzRRAgIEYvbfFgEbpjUNSPQorO5GCr5UKFh1bgk7RVlqMny+VZF2sDWdbnQsQSGanM4KOBZVn4aADKKSNZ2OuyQzo5CKeWEAmoXsGDame8LqLdJy0BC/+BhKWGLQlqZtn/zv/k1gpQrr7WKf2/Pzv6JpL/ADAr2sl1cKcPQlbuQfm/7bO05rkuuTGm19yCJf8Tq6+2tdWRf6S2TWuccq5pTDOJJdJeGKkeLO4frq6usJll2ddxHM4286kf+CMkOsWjFL19VQQW6Kyb/9JQw4eaU3Uz',
  }


#  exec { 'Run my arbitrary command':
#    command => '/bin/echo I ran this command on `/bin/date` >/tmp/command.output.txt',
#  }

#  exec { 'Download public key for John':
#    cwd     => '/tmp',
#    command => '/usr/bin/wget http://bitfieldconsulting.com/files/john.pub',
#    creates => '/tmp/john.pub',
#  }

### TRYING CHAINING COMMAND (not in the Puppet 3 book)

#  exec { 'step 1':
#    command => '/bin/echo Hi step 1 run on `/bin/date` >/tmp/testttss.output.txt',
#  }
  
#  exec { 'step 2':
#    command => '/bin/echo Hi step 2 run on `/bin/date` >/tmp/testtts2.output.txt',
#    require => Exec['step 1'],
#  }

#  exec { 'step 3':
#    command => '/bin/echo Hi step 3 run on `/bin/date` >/tmp/testtts3.output.txt',
#    require => Exec['step 2'],
#  }


#  file { '/tmp/hello':   # PAGE 30
#    content => "Hello, world -nodes\n",
#  }

}


# import 'nodes.pp' :: According to Puppet Labs, the IMPORT command is being deprecated and will not be in use anymore with Puppet 4. [SOURCE: https://docs.puppetlabs.com/puppet/latest/reference/lang_import.html] To get around this while learning Puppet, modules will be used.



