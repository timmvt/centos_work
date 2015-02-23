node 'demo' {  # PAGE 30
  file { '/tmp/hello':
    content => "Hello, world -nodes\n",
  }
}

