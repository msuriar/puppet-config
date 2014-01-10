class dev::hg {
  include dev::hg::config

  package {'mercurial':
    ensure => latest,
  }

  class dev::hg::config {
    include dotfiles
    File {
      owner => 'muz',
      group => 'muz',
      mode  => 0644,
    }

    file {'/home/muz/.hgrc':
      ensure => link,
      target => '.dotfiles/hg/hgrc',
    }
  }
}
