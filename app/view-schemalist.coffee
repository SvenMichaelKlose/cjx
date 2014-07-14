@schemalist = ->
  div().text x.localName for x in records
