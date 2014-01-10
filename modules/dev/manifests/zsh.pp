class dev::zsh {

  include dev::zsh::config

  package {'zsh':
    ensure => latest,
  }

  class dev::zsh::config {
    $user = 'muz'
    include dotfiles

    file {"/home/$user/.zshrc":
      ensure => link,
      target => '.dotfiles/zsh/zshrc',
    }

    file {"/home/$user/.zshenv":
      ensure => link,
      target => '.dotfiles/zsh/zshenv',
    }

    file {"/home/$user/.zprofile":
      ensure => link,
      target => '.dotfiles/zsh/zprofile',
    }
  }
}
