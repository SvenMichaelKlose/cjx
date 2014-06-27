###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

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

extend_field_type = (field) ->
  old_type = field.type
  desc = field.desc
  if t = TYPES[field.type]
    $.extend field, t
    extend_field_type field if field.type isnt old_type
    field.desc = desc if desc
  field
