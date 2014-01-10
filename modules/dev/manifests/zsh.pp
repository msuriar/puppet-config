class dev::zsh::config {
  $user = 'muz'
  include dotfiles
  File {
    owner => $user,
    group => $user,
    mode  => 0644,
  }

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
