def word_unscrambler(str, words)
  str_letters = str.split("").sort

  anagrams = []
  words.each do |word|
    word_letters = word.split("").sort
    anagrams << word if str_letters == word_letters
  end

  anagrams
end

# This could also be written as a two-liner:
#
# def word_unscrambler(str, words)
#   str_letters = str.split("").sort
#   words.select { |word| str_letters == word.split("").sort }
# end
#
# I've chosen to write it more explicitly for clarity to beginners.
