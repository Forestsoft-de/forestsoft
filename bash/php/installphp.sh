#!/bin/bash
EXTENSION_DIR="/usr/local/bin/php/$1/extensions"
PREFIX="/usr/local/bin/php/$1"

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 php5.3.2 [more options for php configure]"
  exit;
fi
if [ !-d "$PREFIX" ]; then
   mkdir $PREFIX
fi

OPTIONS="$2"
OPTIONS="--without-pear --with-pdo-mysql --with-mysql --with-mysqli --without-pear --sysconfdir=$PREFIX/etc --with-config-file-path=$PREFIX/etc --disable-phar --disable-cli $OPTIONS"
cd $1
./configure --prefix=$PREFIX $OPTIONS
if [ "$?" -eq "0" ]; then
  make
  make install
fi
if [ !-d "$EXTENSION_DIR" ]; then
  mkdir -p $EXTENSION_DIR
fi