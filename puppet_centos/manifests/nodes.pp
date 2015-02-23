node 'demo' { 
#  include httpd
#  include sudoers

#  file { '/tmp/hello':		# PAGE 30
#    content => "Hello, world -nodes\n",
#  }

}

