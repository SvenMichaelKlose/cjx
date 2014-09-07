root = @

@SCHEMAS =
  client: [
    name:   "user"
    type:   "textline"
    desc:   "Login"
   ,
    name:   "title"
    type:   "textline"
    desc:   "Title"
   ,
    name:   "name"
    type:   "textline"
    desc:   "Name"
   ,
    name:   "name"
    type:   "textline"
    desc:   "Middle name"
   ,
    name:   "surname"
    type:   "textline"
    desc:   "Surname"
   ,
    name:   "email"
    type:   "email"
    desc:   "Email"
   ,
    name:   "password"
    type:   "password"
    desc:   "Password"
  ]

viewClients = ->
  xroot = XMLDocumentRoot "clients"
  withMixin [
    VIEWS_LIST_EDIT
    VIEWS_SELECTION
    records:     xroot.children()
    parent:      xroot
    schema:      SCHEMAS["client"]
    schemaName:  "client"
    desc:        "Clients"
  ], tableview

$ ->
  initXMLDocument "clients"
  setMixins [
    field: null
    VIEWS_RECORD
    VIEWS_RECORD_DISPLAY
    VIEWS_STRUCTURAL
    VIEWS_TABLE
    VIEWS_XREF
  ]
  pageOpen viewClients
