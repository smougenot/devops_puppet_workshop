  # Class: http
#
# Add http
# 
# == Parameters: 
#
# service   : run as a service
# start     : start the service 
#
# == Requires: 
# 
# 
# == Sample Usage:
# include 'commun::http'
#
class commun::http
(
  $service            =   true,
  $start              =   true,
  $maconf
)
{
    # service http
    package { 'httpd':
        ensure      => 'present'
    }
    
    # la conf perso qui va bien
    file{ '/var/www/html/vagrant.html':
        owner   => root,
        group   => root,
        mode    => 755,
        source  => 'puppet:///modules/commun/vagrant.html',
        require => Package['httpd']
    }

    file{ '/var/www/html/welcome.html':
        owner   => root,
        group   => root,
        mode    => 755,
        content => template('commun/welcome.html.erb'),
        require => Package['httpd']
    }

    # lancement en tant que service
    service {'httpd':
        ensure     => $start,
        enable     => $service,
        hasstatus  => true,
        hasrestart => true,
        require    => Package['httpd']
    }
}