#
# = Class: p2es::back_office
#
# Installe le soft du back office
#
# == Parameters: 
#
# $env::           Nom de l'environnement. 
#                  La valeur par défaut est : integration. 
#                  Valeurs (exemples) integration, preprod, prod
# $version::       Précise la version voulue. 
#                  Pas de valeur par défaut (undef). 
#                  Valeur exemple : 0.6.1-52 (allez voir dans le repo yum). 
#                  En l'absence de valeur la dernière version sera retenue.
#                  ATTENTION si $env vaut "integration" ce sera forcément la dernière version
# 
# == Requires: 
# 
# Classes: repo, pe_home
# 
# == Sample Usage:
#
#   class{ p2es::back_office:
#           $env                =>    "integration",
#            $version              =>    undef,
#   }
class p2es::back_office (
    $env                =    undef,
    $version            =    undef,
    $playversion        =   undef,
){
    if ! defined(Commun::Jdk::Java['java7']) {
      commun::jdk::java {'java7':}
    }

    package { "play":
      ensure  => $playversion,
      require => [Yumrepo['Sogelink-RELEASE'], Package['pe_home']]
    }

    package { "pe_back_office":
      ensure  => $version,
      require => [Yumrepo['Sogelink-RELEASE'], Package['play']]
    }
}
