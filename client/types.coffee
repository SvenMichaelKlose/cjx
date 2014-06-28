TYPES =
  percent:
    type:    "range"
    min:     0
    step:    0.1
    measure: "%"
    desc:    "Prozent"

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

@expand_type = (field) ->
  expand_type $.extend field, t if t = TYPES[field.type]
  field
