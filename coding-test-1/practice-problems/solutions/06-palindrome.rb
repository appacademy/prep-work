# Write a method that takes a string and returns true if it is a
# palindrome. A palindrome is a string that is the same whether written
# backward or forward. Assume that there are no spaces; only lowercase
# letters will be given.
#
# Difficulty: easy.

def palindrome?(string)
  i = 0
  while i < string.length
    if string[i] != string[(string.length - 1) - i]
      return false
    end

    i += 1
  end

  return true
end

puts("palindrome?(\"abc\") == false: #{palindrome?("abc") == false}")
puts("palindrome?(\"abcba\") == true: #{palindrome?("abcba") == true}")
puts("palindrome?(\"z\") == true: #{palindrome?("z") == true}")
