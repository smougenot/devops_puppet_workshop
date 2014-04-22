# Class: role::p2es::v3::bo_pe
#
# Role pour le bo et la pe p2es v3
#
# Sample Usage :
#  include role::p2es::v3::bo_pe
#
# ou
#
#  class { 'role::p2es::v3::bo_pe': }

class role::p2es::v3::inte::bo_pe inherits role::p2es {

  
  include profile::p2es::v3::bo
  
  include profile::p2es::v3::pe
}