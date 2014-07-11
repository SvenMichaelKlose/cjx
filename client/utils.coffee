@do_nothing = -> null

@ensure_element = (x) -> if x.length then x

@ensure_element_array = (x) ->
  if not $.isArray x
    return x
  r = []
  for i in x
    if $.isArray i
      r = $.merge r, i
    else
      r.push i
  r
