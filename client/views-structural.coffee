struct_div = -> (div().addClass "struct")

struct = (options, xml, {desc, data}) ->
  struct_div().append (($ "<h2>").text desc),
                      (render_record options, xml, data)

record_div = -> (div().addClass "field")

@is_record_type = (x) -> ($.inArray x, ["struct", "xreflist"]) is -1

field = (options, xml, field, value) ->
  if is_record_type field.type
    record_div().append (render "label", options, xml, field, value),
                        (hook_field xml, field, render_field options, xml, field, value),
                        (render "measure", options, xml, field, value)
  else
    render field.type, options, xml, field, value

@VIEWS_STRUCTURAL =
  field:          field
  struct:         struct
