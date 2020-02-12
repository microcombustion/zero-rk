#!/bin/bash

mkdir -p ../opt/include
mkdir -p ../opt/lib

tar -xzvf spify.tar.gz


cd spify

sed -i 's|^YAMLCPPDIR.*$|YAMLCPPDIR:=../../opt|' Makefile
sed -i 's|^ar ruv|ar rv|' Makefile
sed -i 's|^all: lib test example|all: lib test|' Makefile

make clean
make

cp -rL ./include/spify ../../opt/include
cp lib/* ../../opt/lib
cp src/SpifyParserGenerator.py ../../opt/include/spify

cd ../
rm -rf spify
