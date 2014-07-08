make_client_form = ->
  form = make_new_form
    parent: RECORDS["clients"]
    schema: "client"
    desc:   "Kunden"
  form.append (($ "<button>").text "Auswahl in Ablage übernehmen"). click (x) ->
    x.preventDefault()
    alert (get_selected_records form).length + " ausgewählt."

make_group_form = ->
  make_new_form
    parent: RECORDS["groups"]
    schema: "group"
    desc:   "Gruppen"

@open_clients = ->
  menu_slide ->
    ($ ".arena form").remove()
    make_client_form()
    make_group_form()
