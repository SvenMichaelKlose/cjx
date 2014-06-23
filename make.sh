#!/bin/sh

coffee -c -b \
    levenshtein.coffee \
    types.coffee \
    records.coffee \
    create-input.coffee \
    index.coffee
