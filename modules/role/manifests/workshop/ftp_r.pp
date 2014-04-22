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

class role::workshop::ftp_r inherits role {

  
  include profile::workshop::ftp_p
}
