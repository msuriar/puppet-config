class dev::vim {
  include dev::vim::config

  package {'vim':
    ensure => latest,
  }

  class dev::vim::config {
    include dotfiles
    File {
      owner => 'muz',
      group => 'muz',
      mode  => 0644,
    }

    file {'/home/muz/.vim':
      ensure => link,
      target => '.dotfiles/vim',
    }

    file {'/home/muz/.vimrc':
      ensure => link,
      target => '.dotfiles/vim/vimrc',
    }
  }
}
