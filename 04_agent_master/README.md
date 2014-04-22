devops_puppet_workshop step 4
======================

**Aim:**
Run the puppet provisionning in agent/master mode.
By the way, install a ftp server

**Means:**
Provided puppet code

Provision your VM using puppet master
----------

On the VM
```bash
vagrant ssh
```

Go root
```bash
sudo -s
```

Run the agent but
- not as a demon
- not installing anything
- with debug
```bash
puppet agent -tdv --noop
```
This must fail (there is no corresponding 'node' declaration for this machine)

**Let's provision using puppet master**

For the demonstration, we have a definition of a node already in the puppet master's code.
This definition applies to any machine having a name (fqdn) containing vworkshopint

Change the hostname to fit the node definition
```bash
hostname
hostname vworkshopint_ZZZ
hostname
```

Provision
```bash
puppet agent -tdv
```
This time the puppet master recognise the VM names as a valid Node reference. Then he gives the catalog back and the agent installs it.

## Congratulation : now you are a Master of "Puppet"
