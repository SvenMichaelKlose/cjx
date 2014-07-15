root = @

KNOWN_KEYS = []
STACK = []

@get_mixins = ->
  set = {}
  set[key] = root[key] for key in KNOWN_KEYS
  set

save_old = ->
  STACK.unshift get_mixins()

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

push_set_or_sets = (sets) ->
  if $.isArray sets
    push set for set in sets
  else
    push sets

pop = -> apply STACK.shift()

pop_set_or_sets = (sets) ->
  if $.isArray sets
    pop() for set in sets
  else
    pop()

@with_mixin = (sets, fun) ->
  if fun?
    push_set_or_sets sets
    r = fun()
    pop_set_or_sets sets
    r
