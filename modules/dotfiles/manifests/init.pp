class dotfiles {

  File {
    owner => 'muz',
    group => 'muz',
    mode  => 0644,
  }

  file { '/home/muz/.dotfiles':
    ensure  => directory,
    recurse => true,
    source  => "puppet:///modules/dotfiles",
    require => User['muz'],
  }

}
