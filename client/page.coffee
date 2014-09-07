root = @

@PAGE_VIEW = null

@page_reopen = ->
  ($ document.body).empty()
  ($ document.body).append PAGE_VIEW[0]()

@page_open = (x) ->
  root.PAGE_VIEW = [x]
  page_reopen()

@page_call = (x) ->
  root.PAGE_VIEW.unshift x
  page_reopen()

@page_return = () ->
  root.PAGE_VIEW.shift()
  page_reopen()

@button_page_back = () ->
  b = button().text "Back"
  b.click (x) ->
    x.preventDefault()
    page_return()
  b
