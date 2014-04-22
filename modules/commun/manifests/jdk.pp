# Class: jdk
#
# Cette classe installe openjdk
#
class commun::jdk {
	
	define java (
	  $version = 'java-1.7.0-openjdk-devel'
	){
		if ! defined ( Package["java_$version"]){
		  package { "java_$version":
			name    => $version,
			ensure  => installed,
			require => Yumrepo['Sogelink-cache']
	      }
		}
	}
}