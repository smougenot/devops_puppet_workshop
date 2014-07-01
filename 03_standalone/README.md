devops_puppet_workshop step 3
======================

**Aim:**
Run the puppet provisionning in standalone mode.
By the way, install a puppet master

**Means:**
Provided puppet code

Provision your VM
----------

On the VM
```bash
vagrant ssh
```

Go root
```bash
sudo -s
```

Check there is no puppet master installed
```bash
service puppetmaster status
```
This must fail (there is no service puppetmaster yet)

**Let's provision**
```bash
puppet apply --modulepath=/vagrant_puppet/modules/ -dv -e "Exec { path => '/bin/:/sbin/:/usr/bin/:/usr/sbin/'} include profile::workshop::puppetmaster_p"
```
This runs puppet and tells him to add the relevant componant to the VM : those described in the puppet::master_install class.

Check puppetmaster is running
```bash
service puppetmaster status
```

## Congratulation : now you are a "Puppet Master"
