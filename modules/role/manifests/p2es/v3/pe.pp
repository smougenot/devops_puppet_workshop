# Class: role::p2es::v3::pe
#
# Role pour la pe p2es v3
#
# Sample Usage :
#  include role::p2es::v3::pe
#
# ou
#
#  class { 'role::p2es::v3::pe': }

class role::p2es::v3::pe inherits role::p2es {

  
  include profile::p2es::v3::pe
}