root = @

option = (txt, value) ->
  o = root.option().text txt
  o.attr "selected", "selected" if txt is value
  o.attr value: txt

selection = ->
  select().append (option m.name, name for name, m of MODULES)

@button_add = -> [
  s = selection()
  (b = button().text "hinzufügen").click -> alert s.val()
]

@open_navigation = ->
  with_mixin [
      schema:  SCHEMAS["navigation"]
      xml:     RECORDS["app"].find "navigation"
      desc:    "Navigation"
    ], ->
      ($ ".arena").append containment = make_containment()
      containment.append_nested button_add(),
                                render_record(),
