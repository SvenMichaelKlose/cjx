@SCHEMAS =
  client: [
    name:   "user"
    type:   "textline"
    desc:   "Login–Name"
    value:  "holidae"
   ,
    name:   "title"
    type:   "textline"
    desc:   "Anrede"
    value:  "Dr."
   ,
    name:   "surname"
    type:   "textline"
    desc:   "Vorname"
    value:  "Frank"
   ,
    name:   "name"
    type:   "textline"
    desc:   "Name"
    value:  "Holidae"
   ,
    name:   "email"
    type:   "email"
    desc:   "E–Mail"
   ,
    name:   "password"
    type:   "password"
    desc:   "Password"
   ,
    name:   "role"
    type:   "selection"
    opts:   ["User", "Admin", "Superadmin"]
    desc:   "Rolle"
    value:  "User"
  ]

  group: [
    name:  "name"
    type:  "textline"
    desc:  "Name"
   ,
    name:  "admin"
    type:  "user"
    desc:  "Gruppenadmin"
   ,
    name:     "clients"
    type:     "xreflist"
    records:  "clients"
    schema:   "client"
    id_field: "user"
    unique:   true
    desc:     "Kunden"
  ]

  clipboard: [
    name:     "clients"
    type:     "xreflist"
    records:  "clients"
    schema:   "client"
    id_field: "user"
    unique:   true
    desc:     "Kunden"
  ]

  menuitem: [
    name: "name"
    type: "textline"
    desc: "Beschriftung"
   ,
    name: "ad"
    type: "ad"
   ,
    name: "is_active"
    type: "boolean"
    desc: "aktiv?"
    attr: true
   ,
    name: "is_global"
    type: "boolean"
    desc: "global?"
    attr: true
   ,
    name: "code"
    type: "password"
    desc: "Code"
  ]

  file: [
    name: "src"
    type: "url"
    desc: "Datei"
   ,
    name: "date"
    type: "date"
    desc: "Erstellungsdatum"
  ]

  library: [
    name:   "images"
    type:   "list"
    schema: "file"
    desc:   "Bilder"
  ]
