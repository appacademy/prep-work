def ordered_vowel_words(str)
  words = str.split(" ")

  ordered_vowel_words = words.select do |word|
    ordered_vowel_word?(word)
  end

  ordered_vowel_words.join(" ")
end

def ordered_vowel_word?(word)
  vowels = ["a", "e", "i", "o", "u"]

  letters_arr = word.split("")
  vowels_arr = letters_arr.select { |l| vowels.include?(l) }

  (0...(vowels_arr.length - 1)).all? do |i|
    vowels_arr[i] <= vowels_arr[i + 1]
  end
end
