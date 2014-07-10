MIXIN_KEYS = []
MIXIN_STACK = []

save_old = () ->
  mix = {}
  mix[key] = value for key, value of MIXIN_KEYS
  MIXIN_STACK.unshift mix

adjoin_keys = (set) ->
  for key, value of set
    if $.inArray key MIXIN_KEYS is -1
      MIXIN_KEYS.push key

apply = (set) ->
  @[key] = value for key, value of set

push = (set) ->
  save_old()
  adjoin_keys set
  apply set

pop = ->
  apply MIXIN_STACK.shift()

@with_mixin = (set, fun) ->
  push set
  r = fun()
  pop()
  r
