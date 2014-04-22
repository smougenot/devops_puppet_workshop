# Class: profile
#
# Profile par defaut : installation des outils communs à tous
#
# Sample Usage :
#  include profile
#
# ou
#
#  class { 'profile': }
class profile {

  $nexus_host       = hiera('nexus_host')
  $yum_repo_host    = hiera('yum_repo_host')
  $git_host         = hiera('git_host')
  
  $nexus_url        = hiera('nexus_url')
  $nexus_username   = hiera('nexus_username')
  $nexus_password   = hiera('nexus_password')
  $nexus_repository = hiera('nexus_repository')
  
  # Définir ce qui est commun 
  # Monitoring?
  # Sécurité?
}

class profile::p2es inherits profile{
	# Nom du projet pour hiera
	$projet         = 'p2es'
}

class profile::octopus inherits profile{
	# Nom du projet pour hiera
	$projet         = 'octopus'
}

class profile::gendoc inherits profile{
	# Nom du projet pour hiera
	$projet         = 'gendoc'
}
