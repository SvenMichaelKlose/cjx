#!/bin/sh

for i in client/*.coffee app/*.coffee; do echo "Compiling $i..."; coffee -c -o js $i; done
