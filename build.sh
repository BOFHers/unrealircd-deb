#!/bin/bash
LANG=C

type debuild >/dev/null 2>&1 || echo -e >&2 "\n ERROR: Please, install 'debuild' to build this application\n You need to install dh-make, devscripts, and autotools-dev in order to build this.\n Do apt-get install dh-make devscripts autotools-dev.\n"; exit 1;
type wget >/dev/null 2>&1 || echo -e >&2 "\n ERROR: Please, install 'wget' to build this application \n"; exit 1;

pkgver=3.2.10.4

if [ -z $1 ];then
        echo -e "\n  Usage: $0 [Version]"
        echo -e "\n\n"
        echo "You do not specify version, using $pkgver"
else
	pkgver=$1        
fi

wget --no-check-certificate -O - https://www.unrealircd.org/downloads/Unreal$pkgver.tar.gz > Unreal$pkgver.tar.gz
[ ! -e pkg ] && mkdir pkg
cd pkg
[ ! -e unrealircd-$pkgver.tar.gz ] && ln -s ../Unreal$pkgver.tar.gz unrealircd-$pkgver.tar.gz
[ ! -e unrealircd_$pkgver.orig.tar.gz ] && ln -s ../Unreal$pkgver.tar.gz unrealircd_$pkgver.orig.tar.gz
[ -e unrealircd-$pkgver ] && rm -rf unrealircd-$pkgver
tar zxf unrealircd-$pkgver.tar.gz
mv Unreal$pkgver unrealircd-$pkgver
cd unrealircd-$pkgver
cp -r ../../debian debian
mv debian/config.settings .
debuild -us -uc


