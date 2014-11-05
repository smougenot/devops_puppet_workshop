# Class: puppet::master_install
#
# Cette classe ajoute le sedrvice puppetmaster
# 
# == Parameters: 
#
#
# == Requires: 
# 
class puppet::master_install
(
    $service            =   true,
    $start              =   true,
)
{
  include puppet::repo::puppetlabs
  
  # puppet-master
  package { 'puppet-server':
    ensure      => 'present',
    install_options => [ "--enablerepo=${::puppet::repo::puppetlabs::yum_name},${::puppet::repo::puppetlabs::yum_name_deps}"]
  }

  exec {"puppet-server-setup":
      command => "puppet resource service puppetmaster ensure=running enable=true",
      require => Package['puppet-server']
  }
}