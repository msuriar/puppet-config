import 'base.pp'

node 'prodigal' inherits base {
  include base::users::desktop
  include base::sudo::dev
  include dev::desktop
}
