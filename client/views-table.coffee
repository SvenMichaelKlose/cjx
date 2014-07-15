root = @

fieldview = (old_record, old_fieldview) ->
  with_mixin [
      fieldview: old_fieldview
      record:    old_record
    ], ->
      if is_record_type field.type
        (td().addClass field.name).append_nested render_field(),
                                                 measure()
      else
        root[field.type]()

record = ->
  row = tr().addClass "record #{schema_name}"
  row.append_nested record_selector?(),
                    render_record(),
                    button_edit?(),
                    button_remove?()

list_headers = -> [
  th() if record_selector?
  for {desc, name} in schema
    if not record_is_ignored name
      th().text desc
]

record_table = (old_record, old_fieldview) ->
  with_mixin [
    fieldview: -> fieldview old_record, old_fieldview
    record:    record
  ], ->
    table().append (thead().append tr().append_nested list_headers()),
                   tbody().append render_list()

@tableview = -> [
  heading?()
  list_selector?() if records.length
  button_add?()
  list_empty() if not records.length
  record_table root.record, root.fieldview
]

list = ->
  with_mixin [
      records:     xml.children()
      parent:      xml
      schema:      SCHEMAS[field.schema]
      schema_name: field.schema
      desc:        field.desc
    ], tableview

@VIEWS_TABLE =
  list: list
