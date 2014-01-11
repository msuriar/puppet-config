import 'base.pp'

node 'prodigal' inherits base {
  include base::users::dev
  include base::sudo::dev
  include dev::bastion
}
