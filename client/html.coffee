make_element = (name, v) ->
  e = $ "<#{name}>"
  e.append v

for n in ["label", "div", "span", "button",
          "h1", "h2", "h3",
          "table", "thead", "tfoot", "tbody", "tr", "th", "td",
          "form", "select", "option"]
  @[n] = do (n) -> (v) -> make_element n, v
