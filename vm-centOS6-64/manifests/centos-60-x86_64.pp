  
  # Time Zone
  file {
  '/etc/timezone':
    ensure => link,
    target => '/usr/share/zoneinfo/Europe/Paris';
  '/etc/localtime':
    ensure => link,
    target => '/usr/share/zoneinfo/Europe/Paris';
  }

  # Hosts (java and jmx are tuchy about it)
  host { 
  # 'puppet':
    # ip => '10.10.25.60',
    # host_aliases => ['vpuppetint', 'puppet.sglk.local', 'vpuppetint.sglk.local'];
  'localhost':
    ip => '127.0.0.1',
    host_aliases => ["${::hostname}", "${::hostname}.${::domain}", 'localhost.localdomain', 'localhost4', 'localhost4.localdomain4', 'puppet'];
  }
  
  # Be welcomming as a VM
  file { '/etc/motd':
    content => "Welcome to your Vagrant-built virtual machine ${::hostname}!\n  Managed by Puppet.\nA ${::operatingsystem} island in the sea of ${::domain}.\n"
  }
  
  # Be a fast learner (learn to install at vm building)
  exec { 'yum_install_booster':
    command => 'yum localinstall -y /vagrant/*.rpm',
	path    => '/usr/bin',
	onlyif  => "find /vagrant -name '*.rpm'"
  }
  
  # REPO YUM   
  yumrepo {
  'mixit-local':
    baseurl  => 'file:///vagrant/repo/',
    enabled  => '1',
    gpgcheck => '0';
  
  # 'sogelink-release':
    # name => 'Sogelink-RELEASE',
    # mirrorlist => 'http://yumrepo/RELEASE/sogelink.repo.mirrorlist',
    # enabled => '1',
    # gpgcheck => '0',
	# metadata_expire=> '60',
	# require => Host['yumRepo'];
  
  # 'sogelink-cache':
    # name => 'Sogelink-CACHE',
    # mirrorlist => 'http://yumrepo/CACHE/sogelink.repo.mirrorlist',
    # enabled => '1',
    # gpgcheck => '0',
	# metadata_expire=> '60',
	# require => Host['yumRepo']
  }

  package { 'bash-completion':
    ensure  => present,
    require => Yumrepo['mixit-local']
  }

  file { '/etc/profile.d/completion.sh':
    content => '[ -x /etc/bash_completion ] && . /etc/bash_completion'
  }  