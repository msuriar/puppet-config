class dev::git {
  include dev::git::config

  package {'git':
    ensure => latest,
  }

  class dev::git::config {
    include dotfiles
    File {
      owner => 'muz',
      group => 'muz',
      mode  => 0644,
    }

    file {'/home/muz/.gitconfig':
      ensure => link,
      target => '.dotfiles/git/gitconfig',
    }
  }
}
