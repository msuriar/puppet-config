class i3 {
  include i3::config

  package {'i3':
    ensure => latest,
  }

  class i3::config {
    include dotfiles
    File {
      owner => 'muz',
      group => 'muz',
      mode  => 0644,
    }

    file {'/home/muz/.i3':
      ensure => link,
      target => '.dotfiles/i3',
    }
  }
}
