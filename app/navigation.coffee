root = @

option = (txt, value) ->
  o = root.option().text txt
  o.attr "selected", "selected" if txt is value
  o.attr value: txt

selection = ->
  select().append (option m.name, name for name, m of MODULES)

@open_navigation = ->
  ($ ".arena").append s = selection()
  ($ ".arena").append b = button().text "hinzufügen"
  b.click -> alert s.val()
