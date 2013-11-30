class dotfiles {

  File {
    owner => 'muz',
    group => 'muz',
    mode  => 0644,
  }

  user { 'muz':
    ensure     => present,
    managehome => true,
  }

  file { '/home/muz/.dotfiles':
    ensure  => directory,
    recurse => true,
    source  => "puppet:///modules/dotfiles",
    require => User['muz'],
  }

}
