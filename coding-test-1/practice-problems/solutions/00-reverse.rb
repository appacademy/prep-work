# Write a method that will take a string as input, and return a new
# string with the same letters in reverse order.
#
# Difficulty: easy.

def reverse(string)
  reversed_string = ""

  i = 0
  while i < string.length
    reversed_string = string[i] + reversed_string

    i += 1
  end

  return reversed_string
end

puts("reverse(\"abc\") == \"cba\": #{reverse("abc") == "cba"}")
puts("reverse(\"a\") == \"a\": #{reverse("a") == "a"}")
puts("reverse(\"\") == \"\": #{reverse("") == ""}")
