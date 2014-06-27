make_element = (name, c, v) ->
  e = $ "<#{name}>"
  e.attr "class", c if c
  e.append v

@div    = (c, v) -> make_element "div", c, v
@span   = (c, v) -> make_element "span", c, v
@button = (c, v) -> make_element "button", c, v
@table = (c, v) -> make_element "table", c, v
@tr = (c, v) -> make_element "tr", c, v
@td = (c, v) -> make_element "td", c, v
