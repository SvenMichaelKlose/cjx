###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

RECORD_INFOS =
  client: [
    name:   "user"
    type:   "textline"
    desc:   "Login–Name"
   ,
    name:   "title"
    type:   "textline"
    desc:   "Anrede"
   ,
    name:   "surname"
    type:   "textline"
    desc:   "Vorname"
   ,
    name:   "name"
    type:   "textline"
    desc:   "Name"
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
    name:    "clients"
    type:    "xreflist"
    records: "clients"
    unique:  "yes"
    desc:    "Apps"
  ]

  app: [
    name:  "name"
    type:  "textline"
    desc:  "Name der Applikation"
   ,
    name:    "client"
    type:    "xref"
    records: "clients"
    field:   "name"
    desc:    "Kunde"
   ,
    name:  "name"
    type:  "selection"
    opts:  ["Tisch", "Stele"]
    value: "Tisch"
    desc:  "Typ"
   ,
    name: "zip"
    type: "zip_de"
    desc: "Wetter–PLZ"
   ,
    name: "keyboard"
    type: "struct"
    desc: "Keyboard"
    data: [
      name: "scaling"
      type: "percent"
      desc: "Skalierung"
     ,
      name: "xpos"
      type: "pixel"
      value: 0
      desc: "X–Verschiebung"
     ,
      name: "ypos"
      type: "pixel"
      value: 0
      desc: "Y–Verschiebung"
    ]
   ,
    name: "display"
    type: "struct"
    desc: "Darstellung"
    data: [
      name: "resulotion"
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
     ,
      name: "autostart_delay"
      type: "seconds"
      desc: "Autom. Autostart der App nach"
     ,
      name: "autorestart_delay"
      type: "minutes"
      desc: "App geht zum Startbildschirm nach"
     ,
      name: "clipboard_doubletap"
      type: "radio"
      desc: "Doppeltippen öffnet Ablage"
     ,
      name: "new_iconset"
      type: "radio"
      desc: "Neues Icon–Set"
     ,
      name: "color"
      type: "color"
      desc: "Highlight–Farbe"
     ,
      name: "scaling"
      type: "percent"
      desc: "Skalierung"
     ,
      name: "scaling_min"
      type: "percent"
      desc: "Skalierung min"
     ,
      name: "scaling_max"
      type: "percent"
      desc: "Skalierung max"
     ,
      name: "xpos"
      type: "pixel"
      desc: "Startkoordinate X"
     ,
      name: "ypos"
      type: "pixel"
      desc: "Startkoordinate Y"
     ,
      name: "do_hide_pi"
      type: "radio"
      desc: "PI verstecken?"
     ,
      name: "do_display_errors"
      type: "radio"
      desc: "Display–Errors?"
     ,
      name: "have_mouse"
      type: "radio"
      desc: "Maus?"
     ,
      name: "have_fixed_navigation"
      type: "radio"
      desc: "Fixierte Navigation unten?"
    ]
   ,
    name: "direct_mail"
    type: "struct"
    desc: "Direktversand"
    data: [
      name: "enable"
      type: "radio"
      desc: "Aktiviert?"
     ,
      name: "enable_cc"
      type: "radio"
      desc: "CC–E–Mail anzeigen?"
     ,
      name: "policy"
      type: "text"
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
      name: "enable"
      type: "radio"
      desc: "Aktiviert?"
     ,
      name: "interval"
      type: "seconds"
      desc: "Intervall in Sekunden"
    ]
   ,
    name: "update"
    type: "struct"
    desc: "Updates"
    data: [
      name: "do_background_update"
      type: "radio"
      desc: "Update im Hintergrund?"
     ,
      name: "update_interval"
      type: "seconds"
      desc: "Update–Interval in Sekunden"
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
        type: "text"
        desc: "Betreff"
       ,
        name: "receiver"
        type: "email"
        desc: "Email–Empfänger (kommagetrennt)"
       ,
        name: "introduction"
        type: "text"
        desc: "Einleitung"
       ,
        name: "footer"
        type: "text"
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
    type: "selection"
    desc: "Werbung"
   ,
    name: "is_active"
    type: "radio"
    desc: "aktiv?"
   ,
    name: "is_global"
    type: "radio"
    desc: "global?"
   ,
    name: "code"
    type: "password"
    desc: "Code"
  ]

  media: [
    name: "file"
    type: "file"
    desc: "Datei"
   ,
    name: "x"
    type: "pixel"
    desc: "X–Position"
   ,
    name: "y"
    type: "pixel"
    desc: "Y–Position"
   ,
    name: "scaling"
    type: "percent"
    desc: "Skalierung"
   ,
    name: "rotation"
    type: "degree"
    desc: "Drehung"
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
    type: "file"
    desc: "Medien"
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
      type: "media"
      desc: "Video"
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
      type: "media"
      desc: "PDF"
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
      type: "media"
      desc: "PDF"
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
    desc:  "Medien"
    list: [
      name: "front"
      type: "media"
      desc: "Vorderseite"
    ]
  ]

  pinboard: [
    name:  "items"
    type:  "list"
    desc:  "Nachrichten"
    list: [
      name: "messsage"
      type: "text"
      desc: "Nachricht"
    ]
  ]

  map: [
    name: "type"
    type: "selection"
    opts: ["normal"]
    desc: "Typ"
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
    type: "radio"
    desc: "Adresszeile einblenden?"
   ,
    name: "has_keyboard"
    type: "radio"
    desc: "Tastatur einblenden?"
   ,
    name:  "blacklist"
    type:  "list"
    desc:  "Blacklist"
    list: [
      name: "url"
      type: "url"
      desc: "URL"
    ]
   ,
    name:  "whitelist"
    type:  "list"
    desc:  "whitelist"
    list: [
      name: "url"
      type: "url"
      desc: "URL"
    ]
  ]

  wall: [
    name:  "blacklist"
    type:  "list"
    desc:  "Blacklist"
    list: [
      name: "item"
      type: "media"
      desc: "Medium"
    ]
  ]
