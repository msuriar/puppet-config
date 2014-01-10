node base {

  $user = 'muz'

  File {
    group => $user,
    owner => $user,
    mode  => '0644',
    audit => all,
  }
}
