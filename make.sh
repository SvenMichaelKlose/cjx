#!/bin/sh

rm -rf js
echo -n "@REVISION =" > _revision.coffee
git log | grep Author: | wc -l >>_revision.coffee
mkdir -p compiled/simple-list
cake.coffeescript build
for i in `find js -name \*.js`; do cat $i >> js/cjx.js; done
cp js/cjx.js cjx.css examples/simple-list/
