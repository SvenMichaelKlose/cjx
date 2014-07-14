@SCHEMAS["app"] = [
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
