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
class commun::ftp
(
    $service            =   true,
    $start              =   true,
)
{
    # service ftp
    if ! defined(Package['vsftpd']){
      package { 'vsftpd':
          ensure      => 'present'
      }
    }
    # la conf perso qui va bien
    file{ '/etc/vsftpd/vsftpd.conf':
        owner   => root,
        group   => root,
        mode    => 600,
        source  => 'puppet:///modules/commun/vsftpd.conf',
        require => Package['vsftpd'],
        before  => Service['vsftpd'],
        notify  => Service['vsftpd']
    }
    
    # lancement en tant que service
    service {'vsftpd':
        ensure     => $start,
        enable     => $service,
        hasstatus  => true,
        hasrestart => true,
        require    => [Package['vsftpd'], File['/etc/vsftpd/vsftpd.conf']]
    }
    
    # tout pour le user
    define user (
        $home_path          =   undef,
        $user               =   undef,
        $password           =   undef,
        $uid                =   undef,
        $group              =   undef,
        $gid                =   undef,
        $system             =   true,
        $shell              =   '/sbin/nologin'
    ){

    if ! defined(Class[commun::ftp]) {
      include commun::ftp
    }
  
    if ! defined(Group[$group]) {
      group { $group:
          ensure => present,
          gid    => $gid
      }
    }
    
    
    if ! defined(User[$user]) {
      user { $user:
          gid             => $group,
          comment         => 'User ftp',
          ensure          => 'present',
          home            => $home_path,
          uid             => $uid,
          system          => $system,
          shell           => $shell,
          require         => Group[$group]
      }
    }
  
    if !defined(File["$home_path"]) {
      file { $home_path:
          ensure => "directory",
          owner => $user,
          group => $group,
          mode => 755,
          require => [User[$user]],
      }
    }
  
    exec { "ftp_user_passwd_$user":
        command => "echo -e '${password}\n${password}' | (passwd --stdin ${user})",
        require => User[$user]
    }
  
    exec {"userList_$user":
        command => "grep -q '^${user}\$' /etc/vsftpd/user_list; \
                    [ $? -eq 0 ] && echo '${user}' deja present \
                    || echo ${user} >> /etc/vsftpd/user_list",
        require => [User[$user], Exec["ftp_user_passwd_$user"], Package['vsftpd']],
        notify  => Service['vsftpd']
    }
  }
}