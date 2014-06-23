field_label = (field) ->
  ($ "<label>").text field.desc + ":"

insert_field = (parent, field) ->
  if field.type is "struct"
    div = $ "<div class='struct'>"
    div.append ($ "<h2>").text field.desc
    insert_fields div, field.data
    parent.append div
  else
    parent.append (field_label field), (create_input field), $ "<br>"

insert_fields = (parent, fields) ->
  insert_field parent, field for field in fields

generate_form = (fields) ->
  insert_fields ($ "form").empty(), fields

generate_form RECORD_INFOS.client
