RECORD_INFOS =
  client: [
    name:  "name"
    type:  "textline"
    desc:  "Name der Applikation"
   ,
    name:  "name"
    type:  "selection"
    opts:  ["Tisch", "Stele"]
    value: "Tisch"
    desc:  "Typ"
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
    name: "resulotion"
    type: "xref"
    ref:  "resolution"
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
    name: "zip"
    type: "zip_de"
    desc: "Wetter–PLZ"
   ,
    name: "do_background_update"
    type: "radio"
    desc: "Update im Hintergrund"
   ,
    name: "update_interval"
    type: "radio"
    desc: "Update–Interval in Sekunden"
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

  address: [
    name: "name"
    type: "text"
    desc: "Name"
   ,
    name: "vorname"
    type: "text"
    desc: "Vorname"
   ,
    name: "tel"
    type: "tel"
    desc: "Telefonnummer"
  ]

  location: [
    name: "latitude"
    type: "range"
    desc: "Breitengrad"
   ,
    name: "longitude"
    type: "range"
    desc: "Längengrad"
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
