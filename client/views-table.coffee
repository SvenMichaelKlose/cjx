struct   = (field, xml) -> null

record = (field, v, xml, options) ->
  if is_record_type field.type
    f = expand_type field
    td().append (render f.type, f, v, options),
                (render "measure", field, null, options)

@VIEWS_TABLE =
  record:    record
  struct:    struct
