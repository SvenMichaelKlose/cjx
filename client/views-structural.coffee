root = @

struct_div = -> div().addClass "struct"

struct = ->
  struct_div().append (h2().text field.desc),
                      with_mixin
                        schema:      field.schema
                        schema_name: null
                        render_record

xschema = ->
  struct_div().append (h2().text field.desc),
                      with_mixin
                        schema:      SCHEMAS[field.schema]
                        schema_name: field.schema
                        render_record

vector_types = ["list", "schemalist", "struct", "xschema", "xreflist"]

@is_record_type = (x) -> ($.inArray x, vector_types) is -1

list_empty = -> div().text "Leer."

@VIEWS_STRUCTURAL =
  struct:      struct
  xschema:     xschema
  list_empty:  list_empty
