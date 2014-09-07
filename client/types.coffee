TYPES =
  percent:
    type:    "range"
    min:     0
    step:    0.1
    measure: "%"
    desc:    "Prozent"

  degree:
    type:    "range"
    min:     0
    max:     359
    step:    0.1
    measure: "°"
    desc:    "Winkelgrad"

  pixel:
    type:    "range"
    min:     0
    step:    1
    measure: "px"
    desc:    "Pixel"

  seconds:
    type:  "range"
    min:   0
    step:  1
    measure:  "s"
    desc:  "Sekunden"

  minutes:
    type:    "range"
    min:     0
    step:    1
    measure: "min"
    desc:    "Minuten"

  zip_de:
    type:  "range"
    min:   10000
    max:   99999
    step:  1
    desc:  "PLZ"

  url:
    type:  "textline"
    desc:  "URL"

@expandType = (field) ->
  field = $.extend {}, field
  expandType $.extend field, t if t = TYPES[field.type]
  field
