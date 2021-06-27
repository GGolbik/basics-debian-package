#!/bin/sh

APP_NAME=ggolbik-basic
APP_VERSION=1.0-1
DEB_NAME=${APP_NAME}_${APP_VERSION}_all

rm --force --recursive ./build
mkdir ./build
cd ./build
mkdir ./${DEB_NAME}

cp -r ../src/* ./${DEB_NAME}/

# remove comment lines
sed '/^#/ d' < ./${DEB_NAME}/DEBIAN/control > ./${DEB_NAME}/DEBIAN/control.temp
mv ./${DEB_NAME}/DEBIAN/control.temp ./${DEB_NAME}/DEBIAN/control

chmod 0755 ./${DEB_NAME}/DEBIAN/config
chmod 0755 ./${DEB_NAME}/DEBIAN/postinst
chmod 0755 ./${DEB_NAME}/DEBIAN/postrm
chmod 0755 ./${DEB_NAME}/DEBIAN/preinst
chmod 0755 ./${DEB_NAME}/DEBIAN/prerm

chmod 0755 ./${DEB_NAME}/usr/local/bin/ggolbik-basic

gzip ./${DEB_NAME}/usr/local/share/man/man1/ggolbik-basic.1

dpkg-deb --build ${DEB_NAME}