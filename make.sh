#!/bin/sh

echo -n "@REVISION =" > _revision.coffee
git log | grep Author: | wc -l >>_revision.coffee
#for i in _revision.coffee client/*.coffee app/*.coffee; do echo "Compiling $i..."; coffee -c -o js $i || exit 1; done
cake.coffeescript build
