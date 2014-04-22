#
# = Class: p2es::plateforme_envoi
#
# Installe le package plateforme_envoi
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
# $ensure::        Permet de forcer l'opération faite sur le package.
#                  Pas de valeur par défaut (undef). 
#                  Valeur exemple : absent, latest, present. 
#                  En l'absence de valeur la variable $version sera utilisée
# 
# == Requires: 
# 
# Classes: repo
# 
# == Sample Usage:
#
#   class{ p2es::plateforme_envoi:
#           $env                =>    "integration",
#            $version              =>    undef,
#            $ensure               =>    undef,
#   }
class p2es::pe_installation (
    $env                        =    undef,
    $version                    =    undef,
    $ensure                     =    undef
){
    if ! defined(Commun::Jdk::Java['java7']) {
      commun::jdk::java {'java7':}
    }

    # Applicatif
    if $ensure == undef {
      case $env {
        'integration': {
          # cas particulier : l'inté doit prendre le dernier package à jour
          $ensure_pkg = 'latest'
        }
        default: {
          if $version == undef {
            # En l'absence de version prendre la plus récente
            $ensure_pkg = 'latest'
          }
          else{
             $ensure_pkg = $version
          }
        }
      }
    }else{
      $ensure_pkg = $ensure
    }

    package { "pe_integration":
        ensure  => $ensure_pkg,
        require => [Yumrepo['Sogelink-RELEASE'], Package['pe_home']]
    }
}
