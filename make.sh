#!/bin/sh

cd client ; coffee -c -b -o ../js \
    levenshtein.coffee \
    types.coffee \
    schemas.coffee \
    xml-gen.coffee \
    overlay.coffee \
    create-input.coffee \
    create-form.coffee \
    preferences.coffee \
    menu.coffee \
    index.coffee
