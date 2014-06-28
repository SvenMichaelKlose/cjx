make_element = (name, v) ->
  e = $ "<#{name}>"
  e.append v

for n in ["div", "span", "button", "table", "thead", "tfoot", "tbody", "tr", "th", "td"]
  @[n] = do (n) -> (v) ->make_element n, v
