require 'rspec'
require '06_word_unscrambler'

# Write a function word_unscrambler that takes two inputs: a scrambled
# word and a dictionary of real words.  Your program must then output
# all words that our scrambled word can unscramble to.
#
# Hint: To see if a string `s1` is an anagram of `s2`, split both
# strings into arrays of letters. Sort the two arrays. If they are
# equal, then they are anagrams.
#
# Difficulty: 3/5

describe "#word_unscrambler" do
  it "should handle a simple word" do
    word_unscrambler("cat", ["tac"]).should == ["tac"]
  end

  it "should not inappropriately choose a word" do
    word_unscrambler("cat", ["tom"]).should_not == ["tom"]
  end

  it "should handle a simple word from a larger dictionary" do
    word_unscrambler("cat", ["tic", "toc", "tac", "toe"])
  end

  it "should only handle words of the correct length" do
    word_unscrambler("cat", ["scatter", "tac", "ca"] ).should == ["tac"]
  end

  it "should handle multiple successful cases" do
    word_unscrambler("turn", ["numb", "turn", "runt", "nurt"]).should == ["turn", "runt", "nurt"]
  end
end
