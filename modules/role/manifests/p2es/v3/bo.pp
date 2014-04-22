# Class: role::p2es::v3::bo
#
# Role pour le bo p2es v3
#
# Sample Usage :
#  include role::p2es::v3::bo
#
# ou
#
#  class { 'role::p2es::v3::bo': }

class role::p2es::v3::bo inherits role::p2es {

  
  include profile::p2es::v3::bo
}
