class base::users {
  $user = 'muz'
  $id   = 1000

  user { $user:
    home       => "/home/$user",
    shell      => '/bin/bash',
    managehome => true,
    uid        => $id,
    gid        => $id,
    password => '*',
  }
}

class base::users::dev inherits base::users {
  require base::zsh

  User[$user] {
       shell => '/bin/zsh',
  }
}

class base::users::bastion inherits base::users::dev {
  # Bastion = headless development machine.
  User[$user] {
       password => undef,
  }
}
