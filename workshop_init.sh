#!/bin/sh
#
# D�ploiement de la conf hiera en local 
# Utile pour les tests en local via puppet apply
# ex: puppet apply -dv --modulepath=/vagrant_puppet/modules/ -e "class{ role::p2es::v2::p2es: }"

_SCRIPTS=$(dirname ${BASH_SOURCE[@]})

# hiera (données et conf) en lien symbolique
for p in `find "${_SCRIPTS}" -maxdepth 1  -iname 'hiera*'`; do  
  echo "$p";  
  _target="/etc/puppet/${p##*/}"; 
  [ -h "$_target" ] && rm -f "$_target";  
  [ -d "$_target" ] && rm -rf "$_target";  
  ln -fs $p "$_target"; 
done

if [ ! -d /etc/puppet_ ]; then
  mv /etc/puppet /etc/puppet_
fi

[ -h /etc/puppet ] && rm -f /etc/puppet
[ -d /etc/puppet ] && rm -rf /etc/puppet

ln -fs "${_SCRIPTS}" '/etc/puppet'
