root = @

structDiv = -> div().addClass "struct"

struct = ->
  structDiv().append (h2().text field.desc),
                     withMixin
                       schema:      field.schema
                       schemaName:  null
                       renderRecord

xschema = ->
  structDiv().append (h2().text field.desc),
                     withMixin
                       schema:      SCHEMAS[field.schema]
                       schemaName:  field.schema
                       renderRecord

VECTOR_TYPES = ["list", "schemalist", "struct", "xschema", "xreflist"]

@isRecordType = (x) -> ($.inArray x, VECTOR_TYPES) is -1

listEmpty = -> div().text "Empty."

@VIEWS_STRUCTURAL =
  struct:     struct
  xschema:    xschema
  listEmpty:  listEmpty
