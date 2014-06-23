RECORD_INFOS =
  client: [
    name: "name"
    type: "textline"
    desc: "Name der Applikation"
   ,
    name: "name"
    type: "option"
    opts: ["Tisch", "Stele"]
    desc: "Type"
   ,
    name: "keyboard"
    type: "struct"
    data:
      name: "scaling"
      type: "range"
      min: 0
      max: 8
      desc: "Skalierung"
     ,
      name: "xpos"
      type: "pixel"
      desc: "X–Verschiebung"
     ,
      name: "ypos"
      type: "pixel"
      desc: "Y–Verschiebung"
   ,
    name: "resulotion"
    type: "xref"
    ref:  "resolution"
    desc: "Auflösung"
   ,
    name: "autostart_delay"
    type: "seconds"
    desc: "Autom. Autostart der App nach Sekunden"
   ,
    name: "autorestart_delay"
    type: "minutes"
    desc: "App geht zum Startbildschirm nach Minuten"
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
    data:
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
      type: "line"
      desc: "Titel"
     ,
      name: "subtitle"
      type: "line"
      desc: "Untertitel"
   ,
    name: "loop"
    type: "struct"
    data:
      name: "enable"
      type: "radio"
      desc: "Aktiviert?"
     ,
      name: "interval"
      type: "seconds"
      desc: "Intervall in Sekunden"
   ,
    name: "color"
    type: "color"
    desc: "Highligh–Farbe"
   ,
    name: "scaling"
    type: "scaling"
    desc: "Skalierung"
   ,
    name: "scaling_min"
    type: "scaling"
    desc: "Skalierung min"
   ,
    name: "scaling_max"
    type: "scaling"
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
    data:
      name: "sender_name"
      type: "line"
      desc: "Absendername"
     ,
      name: "sender"
      type: "email"
      desc: "Absender"
     ,
      name: "feedback"
      type: "struct"
      data:
        name: "subject"
        type: "line"
        desc: "Feedback–Betreff"
       ,
        name: "receiver"
        type: "email"
        desc: "Feedback–Email–Empfänger"
     ,
      name: "clipboard"
      type: "struct"
      desc: "Ablagen–Emails"
      data:
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
