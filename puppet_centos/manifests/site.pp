node 'demo' { 
  include httpd
  include sudoers

  exec { 'Run my arbitrary command':
    command => '/bin/echo I ran this command on `/bin/date` >/tmp/command.output.txt',
  }

  exec { 'Download public key for John':
    cwd     => '/tmp',
    command => '/usr/bin/wget http://bitfieldconsulting.com/files/john.pub',
    creates => '/tmp/john.pub',
  }

### TRYING CHAINING COMMAND (not in the Puppet 3 book)

  exec { 'step 1':
    command => '/bin/echo Hi step 1 run on `/bin/date` >/tmp/testttss.output.txt',
  }
  
  exec { 'step 2':
    command => '/bin/echo Hi step 2 run on `/bin/date` >/tmp/testtts2.output.txt',
    require => Exec['step 1'],
  }

  exec { 'step 3':
    command => '/bin/echo Hi step 3 run on `/bin/date` >/tmp/testtts3.output.txt',
    require => Exec['step 2'],
  }


#  file { '/tmp/hello':   # PAGE 30
#    content => "Hello, world -nodes\n",
#  }

}


# import 'nodes.pp' :: According to Puppet Labs, the IMPORT command is being deprecated and will not be in use anymore with Puppet 4. [SOURCE: https://docs.puppetlabs.com/puppet/latest/reference/lang_import.html] To get around this while learning Puppet, modules will be used.



