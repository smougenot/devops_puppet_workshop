# Class: profile::p2es::v3::pe
#
# Sample Usage :
#  include profile::p2es::v3::pe
#
# ou
#
#  class { 'profile::p2es::v3::pe': }
class profile::p2es::v3::pe  inherits profile::p2es  {
    
    # Donnée en provenance de hiera
    $PE_VERSION        = hiera('pe_version')

    $DATASRC_HOST      = hiera('bdd_pe_host')
    $DATASRC_LOGIN     = hiera('bdd_pe_login')
    $DATASRC_PASSWORD  = hiera('bdd_pe_password')

    $PS_URL            = hiera('ps_url')
    $PS_LOGIN          = hiera('ps_login')
    $PS_PASSWORD       = hiera('ps_password')

    $FILE_CONF_DIR     = hiera('file_conf_dir')

    $JMX_RO_PWD        = hiera('jmx_ro_pwd')
    $JMX_RW_PWD        = hiera('jmx_rw_pwd')

    # Repo YUM
    if !defined(Class['commun::repo']) {
#        class{ commun::repo:
#          env                      => $::environment,
#          yumrepo_host             => $profile::yum_repo_host
#        }
    }

    # Conf
    class{ p2es::pe_configuration:
        env                 =>     $::environment,
        pe_bdd_host         =>     $DATASRC_HOST,
        pe_bdd_username     =>     $DATASRC_LOGIN,
        pe_bdd_password     =>     $DATASRC_PASSWORD,
        ps_url              =>     $PS_URL,
        ps_username         =>     $PS_LOGIN,
        ps_password         =>     $PS_PASSWORD,
        fileconfdir         =>     $FILE_CONF_DIR
    }

    # PE RPM
    class{ p2es::pe_installation:
        env                 =>    $::environment,
        version             =>    $PE_VERSION,
    }

    class{ commun::ftp:
        service             =>  true,
        start               =>  true
    }

    commun::ftp::user{ 'ditv5':
        home_path           =>  '/opt/pe_home/clients/2',
        user                =>  'dictv5',
        password            =>  'dictv5',
        uid                 =>  '1335',
        group               =>  'pe_home',
        gid                 =>  '1230',
        require             =>  Class[p2es::pe_home_data]
    }

    commun::ftp::user{ 'dictv5_bouchon':
        home_path           =>  '/opt/pe_home/clients/20',
        user                =>  'dictv5_bouchon',
        password            =>  'dictv5',
        uid                 =>  '1339',
        group               =>  'pe_home',
        gid                 =>  '1230',
        require             =>  Class[p2es::pe_home_data]
    }
}