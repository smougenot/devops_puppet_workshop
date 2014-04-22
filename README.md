devops_puppet_workshop
======================

A little code to bootstrap a puppet workshop

#Setup
----------

We'll use a VM to try the Puppet code.
- So I offer you to use [Vagrant](http://www.vagrantup.com/)
- And a box for it (kind of an image to build a VM)
- Running using Virtualbox

##Software required

| soft |  link |
| ------------- | ------------- |
| Virtualbox |  [Download Virtualbox](https://www.virtualbox.org/wiki/Downloads)  4.3.10 (the latest at the moment)|
| Virtualbox extensions | [Download Virtualbox Extensions](http://download.virtualbox.org/virtualbox/4.3.10/Oracle_VM_VirtualBox_Extension_Pack-4.3.10-93012.vbox-extpack) |
| Vagrant | [Download Vagrant](http://www.vagrantup.com/downloads.html) |
| A Vagrant box | [centos-6.x-64bit-puppet.3.x-vbox.4.3.10-1.box](http://packages.vstone.eu/vagrant-boxes/boxes/centos-6.x-64bit-puppet.3.x-vbox.4.3.10-1.box) |
| Gepetto (IDE) | [Download Gepetto](http://puppetlabs.github.io/geppetto/download.html) |

> **Warning**
> Because of VM technology, we've to be carefull to have exactly the environment matching the box we try to run
> In particular it's important to have a strict match between box and the VM provider version.
> - centos-6.x-64bit-puppet.3.x-chef.0.10.x-vbox.**4.3.10**-1.box requires Virtualbox **4.3.10**

## Installation
**Installation**
- Follow the instructions from each tool
- install Vagrant after Virtualbox

**box installation**
Run this command :
```bash
vagrant box add centos-6.x-64bit-puppet.3.x-vbox.4.3.10-1 <path or url>
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

# Workshop
----------
[Step 1 : Meet Vagrant](01_vagrant_up)

[Step 2 : Init the VM](02_init_vm)

[Step 3 : Standalone provisionning](03_standalone)

[Step 4 : Agent/Master provisionning](04_agent_master)

Enjoy

> Written with [StackEdit](https://stackedit.io/).

