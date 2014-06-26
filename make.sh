#!/bin/sh

coffee -c -b -o js \
    levenshtein.coffee \
    types.coffee \
    schemas.coffee \
    xml-gen.coffee \
    create-input.coffee \
    create-form.coffee \
    preferences.coffee \
    menu.coffee \
    index.coffee
