@do_nothing = -> null

@ensure_element = (x) -> if x.length then x

ensure_element_array = (x) ->
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
  $.fn.append_nested = (x...) -> this.append ensure_element_array x
