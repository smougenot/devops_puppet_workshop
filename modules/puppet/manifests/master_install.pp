# Class: ftp
#
# Cette classe ajoute un utilisateur ftp
# 
# == Parameters: 
#
#
# == Requires: 
# 
# home_path, user, password, group
# 
# == Sample Usage:
# include 'commun::ftp'
#
# commun::ftp::user{ 'testftp':
#    home_path          =>   '/tmp/testftp',
#    user               =>   'testftp',
#    password           =>   'testftp_pwd',
#    uid                =>   undef,
#    group              =>   'test',
#    gid                =>   undef
# }
#
class puppet::master_install
(
    $service            =   true,
    $start              =   true,
)
{
    # puppet-master
    package { 'puppet-server':
      ensure      => 'present'
    }

    exec {"puppet-server-setup":
        command => "puppet resource service puppetmaster ensure=running enable=true",
        require => Package['puppet-server']
    }
}