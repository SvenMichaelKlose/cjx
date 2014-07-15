@SCHEMAS["media"] = [
  name: "src"
  type: "url"
  attr: true
 ,
  name: "x"
  type: "pixel"
  desc: "X–Position"
  attr: true
 ,
  name: "y"
  type: "pixel"
  desc: "Y–Position"
  attr: true
 ,
  name: "scaling"
  type: "percent"
  desc: "Skalierung"
  attr: true
 ,
  name: "rotation"
  type: "degree"
  desc: "Drehung"
  attr: true
]

@SCHEMAS["dashboard"] = [
  name: "background"
  type: "file"
  desc: "Hintergrundbild"
 ,
  name: "items"
  type: "file"
  desc: "Medien"
]

@SCHEMAS["mediaviewer"] = [
  name: "background"
  type: "file"
  desc: "Hintergrundbild"
 ,
  name: "items"
  type: "list"
  desc: "Medien"
  schema: [
    name: "item"
    type: "struct"
    schema: [
      name: "front"
      type: "media"
      desc: "Vorderseite"
     ,
      name: "back"
      type: "media"
      desc: "Rückseite"
     ,
      name: "video"
      type: "video"
    ]
  ]
]

@SCHEMAS["browser"] = [
  name: "has_address_field"
  type: "boolean"
  desc: "Adresszeile einblenden?"
  attr: true
 ,
  name: "has_keyboard"
  type: "boolean"
  desc: "Tastatur einblenden?"
  attr: true
 ,
  name:  "blacklist"
  type:  "list"
  desc:  "Blacklist"
  schema: [
    name: "url"
    type: "url"
  ]
 ,
  name:  "whitelist"
  type:  "list"
  desc:  "Whitelist"
  schema: [
    name: "url"
    type: "url"
  ]
]

@SCHEMAS["flipbook"] = [
  name: "background"
  type: "file"
  desc: "Hintergrundbild"
 ,
  name: "items"
  type: "list"
  desc: "Medien"
  schema: [
    name: "front"
    type: "media"
    desc: "Vorderseite"
   ,
    name: "back"
    type: "media"
    desc: "Rückseite"
   ,
    name: "pdf"
    type: "pdf"
  ]
]

@SCHEMAS["coverflow"] = [
  name: "background"
  type: "file"
  desc: "Hintergrundbild"
 ,
  name: "items"
  type: "list"
  desc: "Medien"
  schema: [
    name: "front"
    type: "media"
    desc: "Vorderseite"
   ,
    name: "back"
    type: "media"
    desc: "Rückseite"
   ,
    name: "pdf"
    type: "pdf"
  ]
]

@SCHEMAS["slidebook"] = [
  name: "background"
  type: "file"
  desc: "Hintergrundbild"
 ,
  name: "items"
  type: "list"
  desc: "Medien"
  schema: [
    name: "front"
    type: "media"
    desc: "Vorderseite"
   ,
    name: "back"
    type: "media"
    desc: "Rückseite"
   ,
    name: "pdf"
    type: "pdf"
  ]
]

@SCHEMAS["memorie"] = [
  name: "back"
  type: "file"
  desc: "Rückseite"
 ,
  name:  "items"
  type:  "list"
  limit: 12
  desc:  "Vorderseiten"
  schema: [
    name: "media"
    type: "media"
  ]
]

@SCHEMAS["pinboard"] = [
  name:  "items"
  type:  "list"
  desc:  "Nachrichten"
  schema: [
    name: "messsage"
    type: "textarea"
    desc: "Nachricht"
  ]
]

@SCHEMAS["map"] = [
  name: "type"
  type: "selection"
  opts: ["normal"]
  desc: "Typ"
  attr: true
 ,
  name: "location"
  type: "location"
  desc: "Kartenmitte"
 ,
  name:  "pins"
  type:  "list"
  desc:  "Pins"
  schema: [
    name: "pin"
    type: "location"
    desc: "Pin"
  ]
]

@SCHEMAS["wall"] = [
  name:  "list"
  type:  "list"
  schema: [
    name: "url"
    type: "media"
  ]
]
