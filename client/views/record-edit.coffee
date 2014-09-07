root = @

textInput = ->
  $ "<input>"
    type:   field.type
    name:   field.name
    value:  value

range = ->
  e = $ "<input>"
        type:   "text"
        name:   field.name
        value:  value
  min = field.min
  max = field.max
  step = field.step
  deferredSetup ->
    e.spinner
      min:  min
      max:  max
      step: step
  e

password = ->
  withMixin
    field:
      type: "password"
      name: name
    textInput

boolean = ->
  e = withMixin
        field:
          type: "checkbox"
          name: name
        value: "true"
        textInput
  e.attr "checked", "checked" if value is "true"

textarea = ->
  e = $ "<textarea>"
        name: field.name
        cols: field.cols || 60
        rows: field.rows || 12
  e.text value

imageSelection = ->
  $ "<img>"
    src: value

option = (txt, value) ->
  o = root.option().text txt
  o.attr "selected", "selected" if txt is value
  o.attr value: txt

selection = ->
  select().append (option txt, value for txt in field.opts)

@VIEWS_RECORD_EDIT =
  textline:   textInput
  tel:        textInput
  zipDE:      textInput
  percent:    textInput
  pixel:      textInput
  seconds:    textInput
  minutes:    textInput
  color:      textInput
  email:      textInput
  password:   password
  range:      range
  boolean:    boolean
  textarea:   textarea
  image:      imageSelection
  selection:  selection
  user:       textInput
