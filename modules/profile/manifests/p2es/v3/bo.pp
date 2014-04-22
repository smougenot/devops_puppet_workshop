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
class profile::p2es::v3::bo inherits profile::p2es {     
    # Donnée en provenance de hiera
    $PE_VERSION            = hiera('pe_version')
    $JMX_RO_PWD        = hiera('jmx_ro_pwd')
    $JMX_RW_PWD        = hiera('jmx_rw_pwd')

    #include syslogng 

    # Repo YUM
    if !defined(Class['commun::repo']) {
#        class{ commun::repo:
#          yumrepo_host             => $profile::yum_repo_host
#        }
    }

    if !defined(Class['p2es::pe_home']) {
        # Home RPM
        class{ p2es::pe_home:
            version             =>  $PE_VERSION,
            rwpwd               =>  $JMX_RW_PWD,
            ropwd               =>  $JMX_RO_PWD,
        }
    }

    # BO RPM
    class{ p2es::back_office:
        env                     =>  $::environment,
        version                 =>  $PE_VERSION,
    }
}