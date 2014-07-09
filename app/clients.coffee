make_new_form = (options) ->
  ($ ".arena").append options["containment"] = form = make_containment()
  render_list options, options.parent.children()
  form

make_client_form = ->
  form = make_new_form
    parent:     RECORDS["clients"]
    schema:     "client"
    desc:       "Kunden"
    can_create: true
    can_edit:   true
    can_select:   true
  form.append (($ "<button>").text "Auswahl in Ablage übernehmen"). click (x) ->
    x.preventDefault()
    add_to_clipboard get_selected_record_names form

make_group_form = ->
  make_new_form
    parent:     RECORDS["groups"]
    schema:     "group"
    desc:       "Gruppen"
    can_create: true
    can_edit:   true
    can_select:   true

@open_clients = ->
  menu_slide ->
    ($ ".arena form").remove()
    make_client_form()
    make_group_form()
