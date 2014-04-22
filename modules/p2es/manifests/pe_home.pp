#
# = Class: p2es::pe_home
#
# Installe le package pe_home
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
# $ropwd::         JMX : mot de passe pour un accès en lecture seule (Read Only)
#                  La valeur par défaut est : reader. 
# $rwpwd::         JMX : mot de passe pour un accès complet (Read Write)
#                  La valeur par défaut est : admin. 
# 
# == Requires: 
# 
# Classes: repo
# 
# == Sample Usage:
#
#   class{ p2es::pe_home:
#           $env                =>    "integration",
#            $version              =>    undef,
#            $ensure               =>    undef,
#   }
class p2es::pe_home (
    $env                =    undef,
    $version              =    undef,
    $ensure               =    undef,
    $rwpwd              = 'admin',
    $ropwd              = 'reader',
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
    }

    package { "pe_home":
        ensure  => $ensure_pkg,
        require => [Yumrepo['Sogelink-RELEASE']]
    }

    # gestion des mots de passe JMX
    exec{'pe_home_setup':
            command     => "sed -i '\
                s|APP_JMX_READER_PASSWORD=.*|APP_JMX_READER_PASSWORD=${ropwd}|g;\
                s|APP_JMX_ADMIN_PASSWORD=.*|APP_JMX_ADMIN_PASSWORD=${rwpwd}|g\
                ' \
                /etc/pe/pe_home",
            require     => Package['pe_home']
    }
}
