# Class: profile::p2es::v3::bo
#
# Profile des outils de dev
#
# Sample Usage :
#  include profile::p2es::v3::bo
#
# ou
#
#  class { 'profile::p2es::v3::bo': }
class profile::workshop::ftp_p inherits profile::p2es {
    class{ commun::ftp:
        service             =>  true,
        start               =>  true
    }

    commun::ftp::user{ 'mixit':
        home_path           =>  '/home/mixit',
        user                =>  'mixit',
        password            =>  'mixit',
        uid                 =>  '1001',
        group               =>  'mixit',
        gid                 =>  '1000',
    }
}