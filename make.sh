#!/bin/sh

echo -n "@REVISION =" > _revision.coffee
git log | grep Author: | wc -l >>_revision.coffee
cake.coffeescript build
