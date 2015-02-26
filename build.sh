#!/bin/sh
LANG=C
pkgver=3.2.10.4

[ ! -e Unreal$pkgver.tar.gz ] && wget http://www.unrealircd.com/downloads/Unreal$pkgver.tar.gz
[ ! -e pkg ] && mkdir pkg
cd pkg
[ ! -e unrealircd-$pkgver.tar.gz ] && ln -s ../Unreal$pkgver.tar.gz unrealircd-$pkgver.tar.gz
[ ! -e unrealircd_$pkgver.orig.tar.gz ] && ln -s ../Unreal$pkgver.tar.gz unrealircd_$pkgver.orig.tar.gz
[ -e unrealircd-$pkgver ] && rm -rf unrealircd-$pkgver
tar zxf unrealircd-$pkgver.tar.gz
mv Unreal$pkgver unrealircd-$pkgver
cd unrealircd-$pkgver
cp -r ../../debian debian
debuild -us -uc


