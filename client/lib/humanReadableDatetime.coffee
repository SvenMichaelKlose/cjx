ensureTwoDigits = (x) ->
  if x < 10
    return "0" + x
  x

@humanReadableDatetime = (x) ->
  d = new Date()
  d.setTime parseInt x
  day = d.getDate() + 1
  month = d.getMonth() + 1
  year = d.getFullYear()
  hours = ensureTwoDigits d.getHours()
  minutes = ensureTwoDigits d.getMinutes()
  seconds = ensureTwoDigits d.getSeconds()
  "#{day}.#{month}.#{year}, #{hours}:#{minutes}:#{seconds}"
