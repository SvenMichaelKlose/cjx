root = @

field_div = -> (div().addClass "field")
struct_div = -> (div().addClass "struct")

struct = ->
  struct_div().append (h2().text field.desc),
                      with_mixin {schema: field.schema}, render_record

xschema = ->
  struct_div().append (h2().text field.desc),
                      with_mixin {schema: SCHEMAS[field.schema]}, render_record

@is_record_type = (x) -> ($.inArray x, ["list", "schemalist",
                                        "struct", "xschema", "xreflist"]) is -1

fieldview = ->
  if is_record_type field.type
    field_div().append field_label(),
                       (hook_field xml, field, render_field()),
                       measure()
  else
    root[field.type]()

list_empty = -> div().text "Leer."

@VIEWS_STRUCTURAL =
  fieldview:   fieldview
  struct:      struct
  xschema:     xschema
  list_empty:  list_empty
