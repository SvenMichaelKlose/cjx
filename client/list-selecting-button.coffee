@get_selected_records = (containment) ->
  containment.find ".record_selector:checked"

@get_selected_record_names = (containment) ->
  (($ x).attr "name" for x in get_selected_records containment)

@list_selecting_button = (containment) ->
  b = button()
  set = (to) ->
    (containment.find ".record_selector").prop "checked", to
  select_on_click = ->
    (b.text "Alle auswählen").click (x) ->
      x.preventDefault()
      unselect_on_click()
      set true
  unselect_on_click = ->
    (b.text "Alle abwählen").click (x) ->
      x.preventDefault()
      select_on_click()
      set false
  select_on_click()
  b
