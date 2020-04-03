#!/bin/bash

set -e  # exit on the first command failure

apt-get install -y python-cffi python-pycparser

git clone https://github.com/garyachy/vppsb.git
git clone https://github.com/FDio/vpp

cd vpp
git checkout stable/2001
cd -

rm vpp/src/plugins/netlink
rm vpp/src/plugins/router

ln -sf ../../../vppsb/netlink vpp/src/plugins/netlink
ln -sf ../../../vppsb/router vpp/src/plugins/router

cp startup.conf vpp/src/vpp/conf/
cp init.txt vpp/src/vpp/conf/

cd vpp

make install-ext-deps
make install-dep
make build-release
make pkg-deb

cd -
