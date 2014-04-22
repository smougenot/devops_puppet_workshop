node base {
    #include ssh, sudo, git, gitk, repo_cache, repo_release 
}
#attention tous les sous répertoires de nodes doivent contenir au moins un .pp
import 'nodes/*/*.pp'


#filebucket { main: server => "puppet-server-dev" }
#File { backup => main }
Exec { path => '/bin/:/sbin/:/usr/bin/:/usr/sbin/'}
Package { install_options => '--nogpgcheck'}
