require '03_ordered_vowels'
require 'rspec'

describe "#ordered_vowel_words" do
# Write a method ordered_vowel_words that takes a string of lowercase words and returns a string with just the words containing all their vowels (excluding "y") in alphabetical order
# 2/5

  it "should return a word that is in order" do
    ordered_vowel_words("amends").should == "amends"
  end

  it "should not return a word that is not in order" do
    ordered_vowel_words("complicated").should_not == "complicated"
  end

  it "should be okay with double vowels" do
    ordered_vowel_words("afoot").should == "afoot"
  end

  it "should handle a word with a single vowel" do
    ordered_vowel_words("ham").should == "ham"
  end

  it "should handle a word with a single letter" do
    ordered_vowel_words("o").should == "o"
  end

  it "should ignore the letter y" do
    ordered_vowel_words("tamely").should == "tamely"
  end

  it "should properly process a mixed group of words" do
    ordered_vowel_words("this is a test of the vowel ordering system").should == "this is a test of the system"
  end

end
