##  devops_puppet_workshop
======================

A little code to bootstrap a puppet workshop

----------
Setup required
----------

We'll use a VM to try the Puppet code.
- So I offer you to use [Vagrant](http://www.vagrantup.com/)
- And a box for it (kind of an image to build a VM)

##Software required

| soft |  link |
| ------------- | ------------- |
| Virtualbox |  [Download Virtualbox](https://www.virtualbox.org/wiki/Download_Old_Builds_4_3)  4.3.0 (the last one on this page)|
| Virtualbox extensions | [Download Virtualbox Extensions](http://download.virtualbox.org/virtualbox/4.3.0/Oracle_VM_VirtualBox_Extension_Pack-4.3.0-89960.vbox-extpack) |
| Vagrant | [Download Vagrant](http://www.vagrantup.com/downloads.html) |
| A Vagrant box | [centos-6.x-64bit-puppet.3.x-chef.0.10.x-vbox.4.3.0-2.box](http://packages.vstone.eu/vagrant-boxes/boxes/centos-6.x-64bit-puppet.3.x-chef.0.10.x-vbox.4.3.0-2.box) |
| Gepetto (IDE) | [Download Gepetto](http://puppetlabs.github.io/geppetto/download.html) |

> **Warning**
> Because of VM technology, we've to be carefull to have exactly the environment matching the box we try to run
> In particular it's important to have a strict match between box and the VM provider version.
> - centos-6.x-64bit-puppet.3.x-chef.0.10.x-vbox.**4.3.0**-2.box requires Virtualbox **4.3.0**

## Installation
**Installation**
- Follow the instructions of each tool
- install Vagrant after Virtualbox

**box installation**
Run this command :
```bash
vagrant box add centos-6.x-64bit-puppet.3.x-chef.0.10.x-vbox.4.3.0-2.box <path or url>
```

Then you can check :
```bash
vagrant box list
```

##Running the box

As simple as :
```bash
cd vm-centOS6-64
vagrant up
```
Enjoy

> Written with [StackEdit](https://stackedit.io/).

