# Class: profile::workshop::puppetmaster_p
#
# Deploy puppet master and puppet dashboard
#
class profile::workshop::puppetmaster_p inherits profile::p2es {
  class{ puppet::master_install:
      service             =>  true,
      start               =>  true
  }

  class{ puppet::dashboard_install:
      service             =>  true,
      start               =>  true
  }

}