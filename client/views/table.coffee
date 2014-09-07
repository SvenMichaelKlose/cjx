root = @

fieldcontent = ->
  if is_record_type field.type
    [render_field(), measure()]
  else
    root[field.type]()

fieldview = (old_record, old_fieldview) ->
  with_mixin
    fieldview: old_fieldview
    record:    old_record
    fieldcontent

record = ->
  (tr().addClass "record #{schema_name}").append [
    td().append record_selector() if record_selector?
    td().append x for x in render_fields()
    td().append button_edit() if button_edit?
    td().append button_remove() if button_remove?
  ]

list_headers = -> [
  th() if record_selector?
  for {desc, name} in schema
    if not record_is_ignored name
      th().text desc
]

@get_list_class = ->
  if list_class?
    list_class
  else if field?
    field.name
  else
    schema_name

record_table = (old_record, old_fieldview) ->
  with_mixin
    fieldview: -> fieldview old_record, old_fieldview
    record:    record
    ->
      t = table().append (thead().append tr().append list_headers()),
                         tbody().append render_list()
      t.addClass get_list_class()

@tableview = -> [
  heading?()
  list_selector?() if records.length
  button_add?()
  if records.length
    record_table root.record, root.fieldview
  else
    list_empty()
]

list = ->
  with_mixin
    records:     xml.children()
    parent:      xml
    schema:      field.schema
    schema_name: null
    desc:        field.desc
    tableview

@VIEWS_TABLE =
  list: list
