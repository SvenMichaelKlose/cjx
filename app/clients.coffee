make_new_form = () ->
  with_mixin [{records: parent.children()}, VIEWS_TABLE, VIEWS_TABLE_EDIT], ->
    ($ ".arena").append make_containment().append list()

make_client_form = ->
  with_mixin
    parent: RECORDS["clients"]
    schema: "client"
    desc:   "Kunden"
    ->
      form = make_new_form()
      form.append (button().text "Auswahl in Ablage übernehmen"). click (x) ->
        x.preventDefault()
        add_to_clipboard get_selected_record_names form

make_group_form = ->
  with_mixin
    parent: RECORDS["groups"]
    schema: "group"
    desc:   "Gruppen"
    make_new_form

@open_clients = ->
  menu_slide ->
    ($ ".arena form").remove()
    make_client_form()
    make_group_form()
