root = @

KNOWN_KEYS = []
STACK = []

@getMixins = ->
  set = {}
  set[key] = root[key] for key in KNOWN_KEYS
  set

saveOld = ->
  STACK.unshift getMixins()

addKnownKeys = (set) ->
  for key, value of set
    if $.inArray key, KNOWN_KEYS is -1
      KNOWN_KEYS.push key

apply = (set) ->
  root[key] = value for key, value of set

@setMixins = (sets) -> apply set for set in sets

push = (set) ->
  addKnownKeys set
  saveOld()
  apply set

pushSetOrSets = (sets) ->
  if $.isArray sets
    push set for set in sets
  else
    push sets

pop = -> apply STACK.shift()

popSetOrSets = (sets) ->
  if $.isArray sets
    pop() for set in sets
  else
    pop()

@withMixin = (sets, fun) ->
  if fun?
    pushSetOrSets sets
    r = fun()
    popSetOrSets sets
    r
