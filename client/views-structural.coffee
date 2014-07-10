struct_div = -> (div().addClass "struct")

struct = () ->
  struct_div().append (h2().text field.desc),
                      with_mixin {schema: field.data}, render_record()

record_div = -> (div().addClass "field")

@is_record_type = (x) -> ($.inArray x, ["struct", "xreflist"]) is -1

fieldview = () ->
  if is_record_type field.type
    record_div().append field_label(),
                        (hook_field xml, field, render_field()),
                        measure()
  else
    @[field.type]()

@VIEWS_STRUCTURAL =
  fieldview:   fieldview
  struct:      struct
