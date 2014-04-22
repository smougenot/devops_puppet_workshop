#!/bin/sh
#
# D�ploiement de la conf hiera en local 
# Utile pour les tests en local via puppet apply
# ex: puppet apply -dv --modulepath=/vagrant_puppet/modules/ -e "class{ role::p2es::v2::p2es: }"

_SCRIPTS=$(dirname ${BASH_SOURCE[@]})

cp -r ${_SCRIPTS}/hiera* /etc/puppet/

cp -f "${_SCRIPTS}/puppet.conf" '/etc/puppet/puppet.conf'
