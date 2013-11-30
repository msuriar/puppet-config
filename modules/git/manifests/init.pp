class git {
  include git::config

  package {'git':
    ensure => latest,
  }

  class git::config {
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
