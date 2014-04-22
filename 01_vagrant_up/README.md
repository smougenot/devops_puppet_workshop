devops_puppet_workshop step 1
======================

**Aim:**
Check if your virtualization tools are up and running.

**Means:**
The introductions 

Vagrant : meet the guy
----------

```bash
vagrant
```
Describes the commands

```bash
vagrant box list
```
Gives you the list of boxes he knows.
From those he can build a VM.
At the moment you must have at least one.

Vagrant : build your own VM
----------

**let's build it**
Pick the name of a box within the list of boxes Vagrant gave you.
Then, in a new directory, init the box.
```bash
mkdir tmp_box
cd tmp_box
vagrant init centos-6.x-64bit-puppet.3.x-vbox.4.3.10-1
```

This creates a file named Vagrantfile. It describes the VM we want to build.

**Let's run it**
```bash
vagrant up
```
After a little time we have a running VM

**Let's go to the VM**
```bash
vagrant ssh
```
You can access the VM as user vagrant (password is vagrant if required).

**Let's clean up**
```bash
vagrant destroy -f
```
Removes any trace of your VM
