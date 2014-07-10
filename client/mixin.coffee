MIXIN_KEYS = []
MIXIN_STACK = []

root = this

save_old = () ->
  mix = {}
  mix[key] = root[key] for key in MIXIN_KEYS
  MIXIN_STACK.unshift mix

adjoin_keys = (set) ->
  for key, value of set
    if $.inArray key, MIXIN_KEYS is -1
      MIXIN_KEYS.push key

apply = (set) ->
  root[key] = value for key, value of set

@set_mixins = (sets) -> apply set for set in sets

push = (set) ->
  adjoin_keys set
  save_old()
  apply set

pop = -> apply MIXIN_STACK.shift()

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
