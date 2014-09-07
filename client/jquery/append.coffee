@ensureElement = (x) -> if x.length then x

flattenNestedArrays = (x) ->
  if not $.isArray x
    return x
  r = []
  addItems = (x) ->
    for i in x
      if i
        if $.isArray i
          addItems i
        else
          r.push i
  addItems x
  r

$ ->
  oldAppend = $.fn.append
  $.fn.append = (x...) ->
    oldAppend.call this, flattenNestedArrays x
