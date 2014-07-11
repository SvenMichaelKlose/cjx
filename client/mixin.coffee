KNOWN_KEYS = []
STACK = []

root = this

save_old = ->
  mix = {}
  mix[key] = root[key] for key in KNOWN_KEYS
  STACK.unshift mix

add_known_keys = (set) ->
  for key, value of set
    if $.inArray key, KNOWN_KEYS is -1
      KNOWN_KEYS.push key

apply = (set) ->
  root[key] = value for key, value of set

@set_mixins = (sets) -> apply set for set in sets

push = (set) ->
  add_known_keys set
  save_old()
  apply set

pop = -> apply STACK.shift()

@with_mixin = (sets, fun) ->
  if $.isArray sets
    push set for set in sets
  else
    push sets
  r = fun()
  if $.isArray sets
    pop() for set in sets
  else
    pop()
  r
