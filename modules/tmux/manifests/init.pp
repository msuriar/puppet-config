class tmux {
  include tmux::config

  package {'tmux':
    ensure => latest,
  }

  class tmux::config {
    include dotfiles
    File {
      owner => 'muz',
      group => 'muz',
      mode  => 0644,
    }

    file {'/home/muz/.tmux.conf':
      ensure => link,
      target => '.dotfiles/tmux/tmux.conf',
    }
  }
}
