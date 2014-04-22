#é
Exec { path => '/bin/:/sbin/:/usr/bin/:/usr/sbin/'}

include 'commun::ftp'

commun::ftp::user{ 'testftp':
    home_path          =>   '/tmp/testftp',
    user               =>   'testftp',
    password           =>   'testftp_pwd',
    uid                =>   undef,
    group              =>   'test',
    gid                =>   undef	
}
commun::ftp::user{ 'testftp2':
    home_path          =>   '/tmp/testftp2',
    user               =>   'testftp2',
    password           =>   'testftp2_pwd',
    uid                =>   undef,
    group              =>   'test',
    gid                =>   undef	
}