#!/bin/sh
#
#  Init repo with "all you need" as rpm for the workshop
#  This is a fallback repo build in order to avoid 'internet off' problems
#

# some params
_repo='/opt/repo'
_rpms=' vsftpd httpd createrepo apr apr-util apr-util-ldap httpd-tools mailcap openssl mysql-server'

echo "will install yumdownloader and createrepo to build a yum repo in the path: ${_repo}"
echo "will download those rpms : ${_rpms}"

# install tools
yum install -y yum-utils
echo "yumdownloader installed"

# prepare repo
mkdir -p "${_repo}"
chmod -R +x "${_repo}"
echo "path ${_repo} created"

# fire downloads
_log='yumdownloader.log'
echo "will download : ${_rpms}"
echo "logs are in ${_log}"
yumdownloader -v --destdir="${_repo}" --resolve ${_rpms} > "${_log}" 2>&1
yumdownloader -v --destdir="${_repo}" --resolve --enablerepo=puppetlabs,puppetlabs-dep puppet hiera puppet-server puppet-dashboard > "${_log}" 2>&1
yumdownloader -v --destdir="${_repo}" --resolve --enablerepo=epel bash-completion >> "${_log}" 2>&1
echo "rpms downloaded"

# build the repo metadatas
yum install -y createrepo
_log='createrepo.log'
echo "will build yum repo metadatas"
echo "logs are in ${_log}"
createrepo "${_repo}" > "${_log}" 2>&1

# VM to host copy of the files
_vagrant_repo='/vagrant/repo'
if [ -d "${_vagrant_repo}" ]; then
  echo "will copy repo to vagrant (out of the VM)"  
  \cp -rf "${_repo}"/* "${_vagrant_repo}"/
fi