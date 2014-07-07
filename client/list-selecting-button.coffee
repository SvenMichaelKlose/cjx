@list_selecting_button = (containment) ->
  button = ($ "<button>")
  containment.append button
  set = (to) ->
    (containment.find "input[type=checkbox]").prop "checked", to
  select_on_click = ->
    (button.text "Alle auswählen").click (x) ->
      x.preventDefault()
      unselect_on_click()
      set true
  unselect_on_click = ->
    (button.text "Alle abwählen").click (x) ->
      x.preventDefault()
      select_on_click()
      set false
  select_on_click()
  button
