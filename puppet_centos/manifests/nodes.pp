node 'demo' {
  file { '/tmp/hello':
    content => "Hello, world -nodes\n",
  }
}

