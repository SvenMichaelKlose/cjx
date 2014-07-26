root = @

get_selected_records = (containment) ->
  containment.find ".record_selector:checked"

@get_selected_record_names = (containment) ->
  ($ x).attr "name" for x in get_selected_records containment

record_selector = ->
  $ "<input>"
    class: "record_selector"
    type:  "checkbox"
    name:  (xml.children 0).text()

list_selector = ->
  b = button()
  set = (to) ->
    ((b.closest ".containment").find ".record_selector").prop "checked", to
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

@VIEWS_SELECTION =
  record_selector: record_selector
  list_selector:   list_selector
