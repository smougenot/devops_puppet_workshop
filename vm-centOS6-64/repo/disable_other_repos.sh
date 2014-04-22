#!/bin/sh
#
#  Just keep the dedicated cache repo
#  é
#

for p in `find /etc/yum.repos.d/ -iname '*.repo' | grep -v 'mixit'`; do echo "disable $p";  mv "$p" "$p.back"; done