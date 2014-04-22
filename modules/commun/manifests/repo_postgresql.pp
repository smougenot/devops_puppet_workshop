# Class: commun::repo_postgresql
#
# Installation du repo repo_postgresql
# tous les repos sont désactivés
# utiliser l'option __enablerepo repo_postgresql au beoin
# ou les resources enable / disable de cette classe
#
# Parameters:
#
# Sample Usage :
#  include commun::repo_postgresql
#
# ou
#
#  class { 'commun::repo_postgresql':
#  }
#  commun::repo_postgresql::enable{  'test':
#  }
#  commun::repo_postgresql::disable{ 'test':
#  }
class commun::repo_postgresql (
   $repo_setup_rpm ='http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/pgdg-redhat92-9.2-7.noarch.rpm',
   $repo_file      ='pgdg-92-redhat.repo'
)
{

  
 
  # REPO YUM repo_postgresql
  exec { 'repo_postgresql_install_disenabled':
    command   => "yum localinstall -y ${repo_setup_rpm} && \
					sed -i 's|enabled=1|enabled=0|g' /etc/yum.repos.d/${repo_file}",
	creates   => "/etc/yum.repos.d/${repo_file}"
  }

  # activer le repo repo_postgresql globalement 
  # penser à le désactiver 
  # préférer l'option __enablerepo repo_postgresql
  define enable(){
	
	exec { "repo_postgresql_enable_$title":
	  command => "sed -i 's|enabled=1|enabled=0|g' /etc/yum.repos.d/${::repo_file} && \
	              sed -i '0,/enabled=0/s//enabled=1/' /etc/yum.repos.d/${::repo_file}",
	  require => Exec['repo_postgresql_install_disenabled']
	}
	
  }
  
  # désactiver le repo repo_postgresql globalement 
  define disable(){
	
	exec { "repo_postgresql_disable_$title":
	  command => "sed -i 's|enabled=1|enabled=0|g' /etc/yum.repos.d/${::repo_file}",
	  require => Exec['repo_postgresql_install_disenabled']
	}
	
  }
  
}