node 'demo' { 
  include httpd
  include sudoers

#  file { '/tmp/hello':   # PAGE 30
#    content => "Hello, world -nodes\n",
#  }

}


# import 'nodes.pp' :: According to Puppet Labs, the IMPORT command is being deprecated and will not be in use anymore with Puppet 4. [SOURCE: https://docs.puppetlabs.com/puppet/latest/reference/lang_import.html] To get around this while learning Puppet, modules will be used.



