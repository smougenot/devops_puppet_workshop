devops_puppet_workshop step 2
======================

**Aim:**
Run the VM tuned for the workshop.

**Means:**
Some github, and copy/download

Setup **the** VM
----------

You might already have the source but let's suppose you haven't.

**Let's get the sources**
```bash
git clone https://github.com/smougenot/devops_puppet_workshop.git
```

**Let's run the vm**
```bash
cd devops_puppet_workshop
cd vm-centOS6-64
vagrant up
```

**Let's retreive rpm files required**

Aim : fill the directory 'vm-centOS6-64/repo'

In order to do the workshop even without internet, I provide you a script that build a lite local yum repository.

**If you have been given the workshop installation using an USB** flash drive, youy should look for a directory named 'repo'. Just copy it's content to the target directory.

**Otherwise**, inside the VM, run the command :
```bash
/vagrant/repo/init-repo.sh
```
