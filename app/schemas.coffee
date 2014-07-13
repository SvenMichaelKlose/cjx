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

  app: [
    name:  "name"
    type:  "textline"
    value: "Feelgood–Apotheke"
    desc:  "Name der Applikation"
   ,
#    name:    "client"
#    type:    "xref"
#    records: "clients"
#    field:   "name"
#    desc:    "Kunde"
#   ,
    name:  "type"
    type:  "selection"
    opts:  ["Tisch", "Stele"]
    value: "Tisch"
    desc:  "Typ"
    attr: true
   ,
    name: "zip"
    type: "zip_de"
    desc: "Wetter–PLZ"
    attr: true
   ,
    name: "keyboard"
    type: "struct"
    desc: "Keyboard"
    data: [
      name: "scaling"
      type: "percent"
      desc: "Skalierung"
      attr: true
     ,
      name: "xpos"
      type: "pixel"
      value: 0
      desc: "X–Verschiebung"
      attr: true
     ,
      name: "ypos"
      type: "pixel"
      value: 0
      desc: "Y–Verschiebung"
      attr: true
    ]
   ,
    name: "display"
    type: "struct"
    desc: "Darstellung"
    data: [
      name: "resolution"
      type: "selection"
      opts: [
        "1920 x 1200 px (Beamer)"
        "1920 x 1080 px (FullHD)"
        "1280 x 800 px"
        "625 x 800 px"
        "1080 x 1920 px"
        "768 x 1366 px"
      ]
      desc: "Auflösung"
      value: "768 x 1366 px"
      attr: true
     ,
      name: "autostart_delay"
      type: "seconds"
      desc: "Autom. Autostart der App nach"
      value: 300
      attr: true
     ,
      name: "autorestart_delay"
      type: "minutes"
      desc: "App geht zum Startbildschirm nach"
      value: 300
      attr: true
     ,
      name: "clipboard_doubletap"
      type: "boolean"
      desc: "Doppeltippen öffnet Ablage"
      value: true
      attr: true
     ,
      name: "new_iconset"
      type: "boolean"
      desc: "Neues Icon–Set"
      value: false
      attr: true
     ,
      name: "color"
      type: "color"
      desc: "Highlight–Farbe"
      attr: true
     ,
      name: "scaling"
      type: "percent"
      desc: "Skalierung"
      value: 100
      attr: true
     ,
      name: "scaling_min"
      type: "percent"
      desc: "Skalierung min"
      value: 100
      attr: true
     ,
      name: "scaling_max"
      type: "percent"
      desc: "Skalierung max"
      value: 100
      attr: true
     ,
      name: "xpos"
      type: "pixel"
      desc: "Startkoordinate X"
      value: 0
      attr: true
     ,
      name: "ypos"
      type: "pixel"
      desc: "Startkoordinate Y"
      value: 0
      attr: true
     ,
      name: "do_hide_pi"
      type: "boolean"
      desc: "PI verstecken?"
      value: false
      attr: true
     ,
      name: "do_display_errors"
      type: "boolean"
      desc: "Display–Errors?"
      value: false
      attr: true
     ,
      name: "have_mouse"
      type: "boolean"
      desc: "Maus?"
      value: false
      attr: true
     ,
      name: "have_fixed_navigation"
      type: "boolean"
      desc: "Fixierte Navigation unten?"
      value: false
      attr: true
    ]
   ,
    name: "direct_mail"
    type: "struct"
    desc: "Direktversand"
    data: [
      name: "enabled"
      type: "boolean"
      desc: "Aktiviert?"
      value: true
      attr: true
     ,
      name: "enable_cc"
      type: "boolean"
      desc: "CC–E–Mail anzeigen?"
      value: false
      attr: true
     ,
      name: "policy"
      type: "textarea"
      desc: "Datenschutzrichtlinien"
     ,
      name: "title"
      type: "textline"
      desc: "Titel"
     ,
      name: "subtitle"
      type: "textline"
      desc: "Untertitel"
    ]
   ,
    name: "loop"
    type: "struct"
    desc: "Loop"
    data: [
      name: "enabled"
      type: "boolean"
      desc: "Aktiviert?"
      value: false
      attr: true
     ,
      name: "interval"
      type: "seconds"
      desc: "Intervall in Sekunden"
      value: 0
      attr: true
    ]
   ,
    name: "update"
    type: "struct"
    desc: "Updates"
    data: [
      name: "background"
      type: "boolean"
      desc: "Im Hintergrund?"
      attr: true
     ,
      name: "interval"
      type: "seconds"
      desc: "Intervall"
      attr: true
    ]
   ,
    name: "email"
    type: "struct"
    desc: "E–Mail"
    data: [
      name: "sender_name"
      type: "textline"
      desc: "Absendername"
     ,
      name: "sender"
      type: "email"
      desc: "Absender"
     ,
      name: "feedback"
      type: "struct"
      desc: "Feedback"
      data: [
        name: "subject"
        type: "textline"
        desc: "Feedback–Betreff"
       ,
        name: "receiver"
        type: "email"
        desc: "Feedback–Email–Empfänger"
      ]
     ,
      name: "clipboard"
      type: "struct"
      desc: "Ablagen"
      data: [
        name: "subject"
        type: "textline"
        desc: "Betreff"
       ,
        name: "receiver"
        type: "email"
        desc: "Email–Empfänger (kommagetrennt)"
       ,
        name: "introduction"
        type: "textarea"
        desc: "Einleitung"
       ,
        name: "footer"
        type: "textarea"
        desc: "Fußnote"
      ]
    ]
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

  media: [
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

  dashboard: [
    name: "background"
    type: "file"
    desc: "Hintergrundbild"
   ,
    name: "items"
    type: "file"
    desc: "Medien"
  ]

  mediaviewer: [
    name: "background"
    type: "file"
    desc: "Hintergrundbild"
   ,
    name: "items"
    type: "list"
    desc: "Medien"
    list: [
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

  flippic: [
    name: "background"
    type: "file"
    desc: "Hintergrundbild"
   ,
    name: "items"
    type: "list"
    desc: "Medien"
    list: [
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

  coverflow: [
    name: "background"
    type: "file"
    desc: "Hintergrundbild"
   ,
    name: "items"
    type: "list"
    desc: "Medien"
    list: [
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

  slidebook: [
    name: "background"
    type: "file"
    desc: "Hintergrundbild"
   ,
    name: "items"
    type: "list"
    desc: "Medien"
    list: [
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

  memorie: [
    name: "back"
    type: "file"
    desc: "Rückseite"
   ,
    name:  "items"
    type:  "list"
    limit: 12
    desc:  "Vorderseiten"
    list: [
      name: "media"
      type: "media"
    ]
  ]

  pinboard: [
    name:  "items"
    type:  "list"
    desc:  "Nachrichten"
    list: [
      name: "messsage"
      type: "textarea"
      desc: "Nachricht"
    ]
  ]

  map: [
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
    list: [
      name: "pin"
      type: "location"
      desc: "Pin"
    ]
  ]

  browser: [
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
    list: [
      name: "url"
      type: "url"
    ]
   ,
    name:  "whitelist"
    type:  "list"
    desc:  "whitelist"
    list: [
      name: "url"
      type: "url"
    ]
  ]

  wall: [
    name:  "list"
    type:  "list"
    list: [
      name: "url"
      type: "media"
    ]
  ]
