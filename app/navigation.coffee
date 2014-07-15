root = @

option = (txt, value) ->
  (root.option().text txt).attr value: value

selection = ->
  select().append (option m.name, name for name, m of MODULES)

add = (xml, val) ->
  xml.append generate_xml_from_schema val
  ($ ".arena").empty()
  open_navigation()

button_add = -> [
  s = selection()
  (b = button().text "hinzufügen").click do (xml) -> (x) ->
    x.preventDefault()
    add xml, s.val()
]

@open_navigation = ->
  with_mixin [
      VIEWS_RECORD_EDIT
      schema:  SCHEMAS["navigation"]
      records: (RECORDS["app"].find "navigation").children()
      xml:     RECORDS["app"].find "navigation"
      desc:    "Navigation"
    ], -> [
      button_add()
      schemalist()
    ]
