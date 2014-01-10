node base {

  $user = 'muz'

  File {
    group => $user,
    owner => $user,
    mode  => '0644',
  }

  Package {
    ensure => latest,
  }

  include base::ssh
  include base::sudo
}
