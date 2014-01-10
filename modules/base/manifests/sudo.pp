class base::sudo {

  $user = 'muz'
  $cfg  = '/etc/sudoers'

  package { 'sudo' }

  file { $cfg:
    owner   => 'root',
    group   => 'root',
    ensure  => file,
    require => Package['sudo'],
    source  => "puppet:///sudoers",
    mode    => 0440,
  }

  User[$user] {
    groups     => ["sudo"],
    membership => minimum,
    require    => Package['sudo'],
  }

}
