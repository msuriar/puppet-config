class base::users {
  $user = 'muz'
  $id   = 1000

  user { $user:
    home       => "/home/$user",
    shell      => '/bin/bash',
    managehome => true,
    uid        => $id,
    gid        => $id,
  }
}

class base::users::desktop inherits base::users {
  require dev::zsh

  User[$user] {
       shell => '/bin/zsh',
  }
}

class base::users::bastion inherits base::users::desktop {
  # Bastion = headless development machine.
  User[$user] {
       password => '*',
  }
}
