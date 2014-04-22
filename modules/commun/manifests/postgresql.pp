# Class: commun::postgresql
#
# Installation du bash_postgresql
#
# Parameters:
#
# Sample Usage :
#  include commun::postgresql
#
# ou
#
#  class { 'commun::postgresql':
#  }
class commun::postgresql {

  if ! defined(Class['commun::repo_postgresql']) {
    class{ commun::repo_postgresql:}
  }

  # 
  # package { 'postgresql92':
    # ensure          => installed,
	# provider        => 'yum',
    # install_options => [ {'--enablerepo' => 'pgdg92'} ],
	# require         => Class['commun::repo-postgresql']
  # }
  
  exec { 'package_postgresql92':
    command => 'yum install -y --enablerepo pgdg92 postgresql92',
    require => Class['commun::repo_postgresql'],
	creates => '/usr/pgsql-9.2'
  }

}