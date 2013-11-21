class ssh_ca_cfg  {

  package { 'sudo':
    ensure => installed,
  }

  file { '/etc/sudoers':
    ensure  => file,
    require => Package['sudo'],
    source  => "puppet:///modules/ssh_ca_cfg/sudoers",
    mode    => 0440,
  }

  user { 'muz':
    ensure         => present,
    groups         => ["sudo"],
    membership     => minimum,
    require        => Package['sudo'],
    managehome     => true,
    password       => '*',
  }

  package { 'ssh':
    ensure => installed,
  }

  file { '/etc/ssh/sshd_config':
    ensure  => file,
    require => [ Package['ssh'], User['muz'] ],
    source  => "puppet:///modules/ssh_ca_cfg/sshd_config",
    notify  => Service['ssh'],
  }

  service { 'ssh' : }

  file { '/etc/ssh/ca.suriar.net.pub':
    ensure  => file,
    require => Package['ssh'],
    source  => "puppet:///modules/ssh_ca_cfg/ca.suriar.net.pub",
  }
}
