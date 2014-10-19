require '03_ordered_vowels'
require 'rspec'

# Write a method, `ordered_vowel_words(str)` that takes a string of
# lowercase words and returns a string with just the words containing
# all their vowels (excluding "y") in alphabetical order. Vowels may
# be repeated (`"afoot"` is an ordered vowel word).
#
# You will probably want a helper method, `ordered_vowel_word?(word)`
# which returns true/false if a word's vowels are ordered.
#
# Difficulty: 2/5

describe "#ordered_vowel_words" do
  it "returns a word that is in order" do
    ordered_vowel_words("amends").should == "amends"
  end

  it "does not return a word that is not in order" do
    ordered_vowel_words("complicated").should == ""
  end

  it "handles double vowels" do
    ordered_vowel_words("afoot").should == "afoot"
  end

  it "handles a word with a single vowel" do
    ordered_vowel_words("ham").should == "ham"
  end

  it "handles a word with no vowel" do
    ordered_vowel_words("crypt").should == "crypt"
  end

  it "handles a word with a single letter" do
    ordered_vowel_words("o").should == "o"
  end

  it "ignores the letter y" do
    ordered_vowel_words("tamely").should == "tamely"
  end

  it "processes a string with several words" do
    phrase = "this is a test of the vowel ordering system"
    result = "this is a test of the system"

    ordered_vowel_words(phrase).should == result
  end
end
