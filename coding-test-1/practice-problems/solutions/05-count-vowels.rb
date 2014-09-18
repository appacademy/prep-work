# Write a method that takes a string and returns the number of vowels
# in the string. You may assume that all the letters are lower cased.
# You can treat "y" as a consonant.
#
# Difficulty: easy.

def count_vowels(string)
  num_vowels = 0

  i = 0
  while i < string.length
    if (string[i] == "a" || string[i] == "e" || string[i] == "i" || string[i] == "o" || string[i] == "u")
      num_vowels += 1
    end

    i += 1
  end

  return num_vowels
end

puts("count_vowels(\"abcd\") == 1: #{count_vowels("abcd") == 1}")
puts("count_vowels(\"color\") == 2: #{count_vowels("color") == 2}")
puts("count_vowels(\"colour\") == 3: #{count_vowels("colour") == 3}")
puts("count_vowels(\"cecilia\") == 4: #{count_vowels("cecilia") == 4}")
