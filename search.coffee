create_xref_optionbox = (th, selection, field) ->
  o = create_optionbox (get_xref_values field), selection
  o.append (create_optionboxselection "-").click remove_xref_optionbox

add_xref_optionbox = (evt) ->
  create_xref_optionbox (evt.target.closest "th"),
                        null,
                        search_field evt.target

remove_xref_optionbox = (evt) ->
  (evt.target.closest ".xref_selection").remove()

create_xref_search_header = (field) ->
  selections = get_xref_selections field
  th = $ "<th>"
  th.append selections.each (selection) ->
                              create_xref_optionbox th, selection, field
  th.append (($ "<button>").text "+").click add_xref_optionbox

create_search_header = (form, field) ->
  if field.type is "xref"
    create_xref_search_header field
  else
    form.append create_input field

create_search_headers = (form, fields) ->
  fields.each (field) ->
                create_search_header form, field

create_search_form = (fields) ->
  form = $ "<form>"
  form.append ($ "<th>").append create_search_headers form, fields
