def word_unscrambler(str, words)
  anagrams = words.select { |word| word.split("").sort == str.split("").sort}

  puts anagrams
end
