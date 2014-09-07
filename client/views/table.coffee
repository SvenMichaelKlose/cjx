root = @

fieldcontent = ->
  if isRecordType field.type
    [renderField(), measure()]
  else
    root[field.type]()

fieldview = (oldRecord, oldFieldview) ->
  withMixin
    fieldview: oldFieldview
    record:    oldRecord
    fieldcontent

record = ->
  (tr().addClass "record #{schemaName}").append [
    td().append recordSelector() if recordSelector?
    td().append x for x in renderFields()
    td().append buttonEdit() if buttonEdit?
    td().append buttonRemove() if buttonRemove?
  ]

listHeaders = -> [
  th() if recordSelector?
  for {desc, name} in schema
    if not recordIsIgnored name
      th().text desc
]

@getListClass = ->
  if listClass?
    listClass
  else if field?
    field.name
  else
    schemaName

recordTable = (oldRecord, oldFieldview) ->
  withMixin
    fieldview: -> fieldview oldRecord, oldFieldview
    record:    record
    ->
      t = table().append (thead().append tr().append listHeaders()),
                         tbody().append renderList()
      t.addClass getListClass()

@tableview = -> [
  heading?()
  listSelector?() if records.length
  buttonAdd?()
  if records.length
    recordTable root.record, root.fieldview
  else
    listEmpty()
]

list = ->
  withMixin
    records:     xml.children()
    parent:      xml
    schema:      field.schema
    schemaName:  null
    desc:        field.desc
    tableview

@VIEWS_TABLE =
  list: list
