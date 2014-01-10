class base::sudo inherits base::users {

  $user = 'muz'
  $cfg  = '/etc/sudoers'

  package { 'sudo': }

  file { $cfg:
    owner   => 'root',
    group   => 'root',
    ensure  => file,
    require => Package['sudo'],
    source  => "puppet:///modules/base/sudoers",
    mode    => 0440,
  }

  User[$user] {
    groups     => ["sudo"],
    membership => minimum,
    require    => Package['sudo'],
  }

}

class base::sudo::dev inherits base::sudo {
  File[$cfg] {
    source => undef,
  }
}
