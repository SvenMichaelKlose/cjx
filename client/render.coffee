VIEWS = {}

@render = (name, options, xml, field, value) ->
  unless VIEWS
    alert "Now views defined. Cannot render anything."
    debugger
  unless VIEWS[name]
    alert "No view for type '" + name + "' in '" + field.name + "'."
    debugger
  VIEWS[name] options, xml, field, value

@with_views = (views, fun) ->
  old_views = $.extend {}, VIEWS
  $.extend VIEWS, x for x in views
  r = fun()
  VIEWS = old_views
  r
