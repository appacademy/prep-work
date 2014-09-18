# Write a method that takes in a string. It should split return the
# longest word in the string. You may assume that the string contains
# only letters and spaces.
#
# Difficulty: easy.

def longest_word(sentence)
  words = sentence.split(" ")

  longest_word = nil

  word_idx = 0
  while word_idx < words.length
    current_word = words[word_idx]

    if longest_word == nil
      longest_word = current_word
    elsif longest_word.length < current_word.length
      longest_word = current_word
    end

    word_idx += 1
  end

  return longest_word
end

puts("longest_word(\"short longest\") == \"longest\": #{longest_word("short longest") == "longest"}")
puts("longest_word(\"one\") == \"one\": #{longest_word("one") == "one"}")
puts("longest_word(\"abc def abcde\") == \"abcde\": #{longest_word("abc def abcde") == "abcde"}")
