@make_new_form = ->
  with_mixin [{records: parent.children()}, VIEWS_TABLE, VIEWS_TABLE_EDIT], ->
    ($ ".arena").append make_containment().append list()

@open_clients = ->
  menu_slide ->
    with_mixin
      parent: RECORDS["clients"]
      schema: "client"
      desc:   "Kunden"
      ->
        form = make_new_form()
        form.append (button().text "Auswahl in Ablage übernehmen"). click (x) ->
          x.preventDefault()
          add_to_clipboard get_selected_record_names form
