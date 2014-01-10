import 'base.pp'

node 'prodigal' inherits base {
  include dev::zsh
  include base::users::dev
}
