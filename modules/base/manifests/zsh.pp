class base::zsh {
  include base::zsh::config

  package {'zsh':
    ensure => latest,
  }

  class base::zsh::config {
    include dotfiles
    File {
      owner => 'muz',
      group => 'muz',
      mode  => 0644,
    }

    user {'muz':
      shell => '/bin/zsh',
    }

    file {'/home/muz/.zshrc':
      ensure => link,
      target => '.dotfiles/zsh/zshrc',
    }

    file {'/home/muz/.zshenv':
      ensure => link,
      target => '.dotfiles/zsh/zshenv',
    }

    file {'/home/muz/.zprofile':
      ensure => link,
      target => '.dotfiles/zsh/zprofile',
    }
  }
}
