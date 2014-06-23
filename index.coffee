insert_field = (parent, field) ->
    parent.append (field_label field),
                  (create_input field),
                  $ "<br>"

insert_fields = (parent, fields) ->
    i = 0
    while item = fields[i++]
        insert_field parent, item

generate_form = (fields) ->
    insert_fields ($ "form").empty(), fields

generate_form RECORD_INFOS.address
