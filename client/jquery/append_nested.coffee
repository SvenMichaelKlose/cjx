@ensure_element = (x) -> if x.length then x

flatten_nested_arrays = (x) ->
  if not $.isArray x
    return x
  r = []
  add_items = (x) ->
    for i in x
      if i
        if $.isArray i
          add_items i
        else
          r.push i
  add_items x
  r

$ ->
  old_append = $.fn.append
  $.fn.append = (x...) ->
    old_append.call this, flatten_nested_arrays x
