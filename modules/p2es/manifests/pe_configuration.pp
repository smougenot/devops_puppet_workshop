# = Class: p2es::pe_configuration
#
# Installe le la configuration de la plateforme d'envoi
#
# == Parameters: 
#
# $env::              Nom de l'environnement. 
#                     La valeur par défaut est : integration. 
#                      Valeurs (exemples) integration, preprod, prod
# $ensure::           Permet de forcer l'opération faite .
#                      Pas de valeur par défaut (undef). 
#                     Valeur possible : absent. 
# $app:                Pour le templating : Nom de l'application 
#                       La valeur par défaut est : pe_conf. 
# $appdir::        Pour le templating : chemin de l'application
#                  La valeur par défaut est : /opt/pe_conf. 
# $pe_bdd_host:        Base de données, host
#                      La valeur par défaut est : 10.10.25.23. 
# $pe_bdd_username:     Base de données, login
#                     La valeur par défaut est : l_pe. 
# $pe_bdd_password:     Base de données, login
#                    La valeur par défaut est : l_pe. 
# $ps_url:           PS, host
#                    La valeur par défaut est : 10.10.25.34. 
# $ps_username:      PS, login
#                    La valeur par défaut est : admin. 
# $ps_password:      PS, password
#                     La valeur par défaut est : password. 
# 
# == Requires: 
# 
# Rien.
# 
# == Sample Usage:
#
#    class{ p2es::pe_configuration:
#        env             =>     'preprod',
#        pe_bdd_host        =>     '10.10.25.23',
#        pe_bdd_username =>     'l_pe',
#        pe_bdd_password =>     'l_pe',
#        ps_url           =>     '10.10.25.34',
#        ps_username     =>     'admin',
#        ps_password     =>     'password',
#         ensure          =>      undef #undef #'absent'
#    }
#
class p2es::pe_configuration(
    $env=undef,
    $app      ="pe_conf",
    $appdir   ="/opt/pe_conf",
    $pe_bdd_host=undef,
    $pe_bdd_username="l_pe",
    $pe_bdd_password="l_pe",
    $ps_url=undef,
    $ps_username="admin",
    $ps_password="password",
    $ensure   ='',
    $fileconfdir = "/etc/pe"
)
{
    # calculs de quelques chemins pour le template
    $fileconf    = "${fileconfdir}/pe_conf"
    $logdir      ="/var/log/${app}"
    $tmpdir      ="/tmp/${app}"
    
    # vérifier ce qu'il doit être fait
    $ensure_dir  = $ensure ? {
      'absent'              => 'absent',
      default               => 'directory'
    }
    $ensure_file = $ensure ? {
      'absent'              => 'absent',
      default               => 'file'
    }
    
    
    # create a directory
    file { $fileconfdir:
        ensure  => $ensure_dir,
        recurse => true,
        force   => true
    }
    
    file { $fileconf:
        owner   => root,
        group   => root,
        mode    => 644,
        content => template("p2es/pe_conf.erb"),
        require => File[$fileconfdir],
        ensure  => $ensure_file
    }
}