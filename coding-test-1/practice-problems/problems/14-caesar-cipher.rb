# Write a method that takes in an integer `offset` and a string.
# Produce a new string, where each letter is shifted by `offset`. You
# may assume that the string contains only lowercase letters and
# spaces.
#
# When shifting "z" by three letters, wrap around to the front of the
# alphabet to produce the letter "c".
#
# You'll want to use String's `ord` method and Integer's `chr` method.
# `ord` converts a letter to an ASCII number code. `chr` converts an
# ASCII number code to a letter. You may also want to use the `%`
# modulo operation to handle wrapping of "z" to the front of the
# alphabet.
#
# Difficulty: hard.

def caesar_cipher(offset, string)
end

puts("caesar_cipher(3, \"abc\") == \"def\": #{caesar_cipher(3, "abc") == "def"}")
puts("caesar_cipher(3, \"abc xyz\") == \"def abc\": #{caesar_cipher(3, "abc xyz") == "def abc"}")
