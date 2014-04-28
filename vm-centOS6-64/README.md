Here are a little help 
=====================

This folder is the definition of a box with a little settup for the workshop.

## Step one 
Check the Vagrant & box installation
```bash
vagrant box list
vagrant init centos-6.x...box
vagrant up
vagrant ssh
vagrant destroy -f
```
----------

## Step two 
Run the vm preconfigured for the workshop
```bash
cd puppet
cd vm-centOS6-64
vagrant up
vagrant ssh
```

----------

## Step three 
Local puppet to provision a puppet-master
```bash
puppet apply --modulepath=/vagrant_puppet/modules/ -dv -e " Exec { path => '/bin/:/sbin/:/usr/bin/:/usr/sbin/'} include puppet::master_install"
```

----------

## Step four
Puppet master to provision 
```bash
puppet agent –tdv --noop
hostname vworkshopint_ZZZ
puppet agent -tdv
```

----------

## Step five
Local puppet to provision a httpd
```bash
puppet apply --modulepath=/vagrant_puppet/modules/ -dv -e " Exec { path => '/bin/:/sbin/:/usr/bin/:/usr/sbin/'} include profile::workshop::p_http"
```

----------

## Usefull
All facts on the machine
```bash
  puppet apply -v -e 'file { "/tmp/facts.yaml": content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),}'
  more /tmp/facts.yaml
```
