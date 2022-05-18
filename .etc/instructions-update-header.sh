#!/usr/bin/env bash

for f in $(fd -H "Instructions.md" ../); do 
	cat <(cat instructions-header.md) <(sed -n -e '/## /,$p' $f) | sponge $f
done

cwd=$(pwd)
for f in $(fd -H "copy.mk" ../); do
	cd $(dirname $f)
	./copy.mk
	cd $cwd
done