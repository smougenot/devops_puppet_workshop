# Class: puppet::dashboard_install
#
# Cette classe ajoute le sedrvice puppetdashboard
# 
# == Parameters: 
#
#
# == Requires: 
# 
class puppet::dashboard_install
(
    $service            = true,
    $start              = true,
    $dashboardDbPwd     = 'apicil2014',
)
{
  
  include puppet::repo::puppetlabs
  
  # puppet-dashboard
  package { 
  'mysql-server':
    ensure      => 'present'
  ;
  'puppet-dashboard':
    ensure      => 'present',
    install_options => [ "--enablerepo=${::puppet::repo::puppetlabs::yum_name},${::puppet::repo::puppetlabs::yum_name_deps}"]
  }
  
  service { 
  'mysqld':
    ensure    => true,
    enable    => true,
    hasstatus => true,
    require   => Package['mysql-server']
  ;
  'puppet-dashboard':
    ensure   => $start,
    enable   => $service,
    require  => Exec['puppet-dashboard-mysql-init']
  ;
  'puppet-dashboard-workers':
    ensure   => $start,
    enable   => $service,
    require  => Exec['puppet-dashboard-mysql-init']
  }
  
  # base de donnée du dashboard
  exec { 'puppet-dashboard-mysql-create':
    command => "mysql -e  \"CREATE DATABASE IF NOT EXISTS dashboard_production CHARACTER SET utf8;
                GRANT ALL PRIVILEGES ON dashboard_production.* TO 'dashboard'@'localhost' IDENTIFIED BY '${dashboardDbPwd}';
                set GLOBAL max_allowed_packet = 33554432; 
                \"",
    require => Service['mysqld']
  }

  # configuration du dashboard
  exec { 'puppet-dashboard-config':
    command => "sed -i 's|password:.*|password: ${dashboardDbPwd}|g' /usr/share/puppet-dashboard/config/database.yml",
    require => Package['puppet-dashboard']
  }
  
  # configuration du dashboard
  exec { 'puppet-dashboard-mysql-init':
    command => "echo 'toto' && cd /usr/share/puppet-dashboard/config;
                rake RAILS_ENV=production db:migrate ",
    require => [Exec['puppet-dashboard-config'],Exec['puppet-dashboard-mysql-create']]
  }
}