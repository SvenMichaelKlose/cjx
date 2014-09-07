root = @

@PAGE_VIEW = null

@pageReopen = ->
  ($ document.body).empty()
  ($ document.body).append PAGE_VIEW[0]()

@pageOpen = (x) ->
  root.PAGE_VIEW = [x]
  pageReopen()

@pageCall = (x) ->
  root.PAGE_VIEW.unshift x
  pageReopen()

@pageReturn = () ->
  root.PAGE_VIEW.shift()
  pageReopen()

@buttonPageBack = () ->
  b = button().text "Back"
  b.click (x) ->
    x.preventDefault()
    pageReturn()
  b
