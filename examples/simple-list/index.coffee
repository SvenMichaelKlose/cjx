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

view_clients = ->
  xroot = xml_root "clients"
  with_mixin [
    VIEWS_LIST_EDIT
    VIEWS_SELECTION
    records:     xroot.children()
    parent:      xroot
    schema:      SCHEMAS["client"]
    schema_name: "client"
    desc:        "Clients"
  ], tableview

@PAGE_VIEW = null

@page_reopen = ->
  ($ document.body).empty()
  ($ document.body).append PAGE_VIEW()

@page_open = (x) ->
  root.PAGE_VIEW = x
  page_reopen()

$ ->
  init_xml_doc "clients"
  set_mixins [
    field: null
    VIEWS_RECORD
    VIEWS_RECORD_DISPLAY
    VIEWS_STRUCTURAL
    VIEWS_TABLE
    VIEWS_XREF
  ]
  page_open view_clients
