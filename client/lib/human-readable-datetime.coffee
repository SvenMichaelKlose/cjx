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
