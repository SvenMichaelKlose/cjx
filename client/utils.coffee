@ensure_element = (x) -> if x.length then x

ensure_element_array = (x) ->
  if not $.isArray x
    return x
  r = []
  add_items = (x) ->
    for i in x
      if i
        if $.isArray i
          add_items i
        else
          r.push i
  add_items x
  r

$ ->
  $.fn.append_nested = (x...) -> this.append ensure_element_array x

@path_filename = (x) ->
  x.replace /^.*(\\|\/|\:)/, ''

two_digit_string = (x) ->
  if x < 10
    return "0" + x
  x

@human_readable_datetime = (x) ->
  d = new Date()
  d.setTime parseInt x
  day = d.getDate() + 1
  month = d.getMonth() + 1
  year = d.getFullYear()
  hours = two_digit_string d.getHours()
  minutes = two_digit_string d.getMinutes()
  seconds = two_digit_string d.getSeconds()
  "#{day}.#{month}.#{year}, um #{hours}:#{minutes}:#{seconds}"
