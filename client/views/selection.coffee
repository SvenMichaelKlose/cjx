root = @

getSelectedRecords = (containment) ->
  containment.find ".recordSelector:checked"

@getSelectedRecordNames = (containment) ->
  ($ x).attr "name" for x in getSelectedRecords containment

recordSelector = ->
  $ "<input>"
    class: "recordSelector"
    type:  "checkbox"
    name:  (xml.children 0).text()

listSelector = ->
  b = button()
  set = (to) ->
    ((b.closest ".containment").find ".recordSelector").prop "checked", to
  selectOnClick = ->
    (b.text "Select all").click (x) ->
      x.preventDefault()
      unselectOnClick()
      set true
  unselectOnClick = ->
    (b.text "Unselect all").click (x) ->
      x.preventDefault()
      selectOnClick()
      set false
  selectOnClick()
  b

@VIEWS_SELECTION =
  recordSelector: recordSelector
  listSelector:   listSelector
