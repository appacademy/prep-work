# Write a method that will take in a number of minutes, and returns a
# string that formats the number into `hours:minutes`.
#
# Difficulty: easy.

def time_conversion(minutes)
  hours = 0

  while minutes >= 60
    hours += 1
    minutes -= 60
  end

  if minutes < 10
    minutes_s = "0" + minutes.to_s
  else
    minutes_s = minutes.to_s
  end

  return hours.to_s + ":" + minutes_s
end

puts("time_conversion(15) == \"0:15\": #{time_conversion(15) == "0:15"}")
puts("time_conversion(150) == \"2:30\": #{time_conversion(150) == "2:30"}")
puts("time_conversion(360) == \"6:00\": #{time_conversion(360) == "6:00"}")
