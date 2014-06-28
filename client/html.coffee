make_element = (name, c, v) ->
  e = $ "<#{name}>"
  e.attr "class", c if c
  e.append v

@div    = (c, v) -> make_element "div", c, v
@span   = (c, v) -> make_element "span", c, v
@button = (c, v) -> make_element "button", c, v
@table = (c, v) -> make_element "table", c, v
@thead = (c, v) -> make_element "thead", c, v
@tfoot = (c, v) -> make_element "tfoot", c, v
@tbody = (c, v) -> make_element "tbody", c, v
@tr = (c, v) -> make_element "tr", c, v
@td = (c, v) -> make_element "td", c, v