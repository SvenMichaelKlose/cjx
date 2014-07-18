root = @

fieldcontent = ->
  if is_record_type field.type
    [render_field(), measure()]
  else
    root[field.type]()

fieldview = (old_record, old_fieldview) ->
  with_mixin [
      fieldview: old_fieldview
      record:    old_record
    ], fieldcontent

record = ->
  (tr().addClass "record #{schema_name}").append_nested [
    td().append_nested record_selector() if record_selector?
    td().append_nested x for x in render_fields()
    td().append_nested button_edit() if button_edit?
    td().append_nested button_remove() if button_remove?
  ]

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
    (table().addClass field?.name).append (thead().append tr().append_nested list_headers()),
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
      schema:      field.schema
      desc:        field.desc
    ], tableview

@VIEWS_TABLE =
  list: list
