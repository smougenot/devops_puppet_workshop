#!/bin/sh
#
#  Init for vultr VM (or any brand new centos7)
#

# addon pour installer le repo puppet
yum localinstall -y http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm


# git puppet
yum install -y git puppet

# init repo (ro)
cd /opt && git clone https://github.com/smougenot/devops_puppet_workshop.git
