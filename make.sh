#!/bin/sh

coffee -c -b -o js \
    levenshtein.coffee \
    types.coffee \
    records.coffee \
    create-input.coffee \
    create-form.coffee \
    preferences.coffee \
    menu.coffee \
    index.coffee
