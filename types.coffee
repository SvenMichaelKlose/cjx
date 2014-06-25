###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

TYPES =
  textline:
    type:   "text"

  boolean:
    type:   "checkbox"

  range:
    filter: (field, x) -> x.spinner min:  field.min,
                                    max:  field.max,
                                    step: field.step
    desc:  "Wertebereich"

  percent:
    type:    "range"
    min:     0
    step:    0.1
    measure: "Prozent"
    desc:    "Prozent"

  pixel:
    type:    "range"
    min:     0
    step:    1
    measure: "Pixel"
    desc:    "Pixel"

  seconds:
    type:  "range"
    min:   0
    step:  1
    measure:  "Sekunden"
    desc:  "Sekunden"

  minutes:
    type:    "range"
    min:     0
    step:    1
    measure: "Minuten"
    desc:    "Minuten"

  zip_de:
    type:  "range"
    min:   10000
    max:   99999
    step:  1
    desc:  "PLZ"
