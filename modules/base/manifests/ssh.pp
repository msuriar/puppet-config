class base::ssh  {

  package { 'ssh':
    ensure => installed,
  }

  file { '/etc/ssh/sshd_config':
    ensure  => file,
    require => Package['ssh'],
    source  => "puppet:///modules/base/sshd_config",
    notify  => Service['ssh'],
  }

  service { 'ssh' : }

  file { '/etc/ssh/ca.suriar.net.pub':
    ensure  => file,
    require => Package['ssh'],
    source  => "puppet:///modules/base/ca.suriar.net.pub",
  }

}
