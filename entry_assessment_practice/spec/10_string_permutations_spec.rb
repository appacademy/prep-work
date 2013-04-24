require 'rspec'
require '10_string_permutations'

describe "#string_permutations" do
# Write a function string_permutations which takes in a string and returns all permutations of its letters
# 4/5

  it "should return an array of permutations" do
    string_permutations("ab").should == ["ab", "ba"]
  end

  it "should work for longer words" do
    string_permutations("cat").sort.should == ["act", "atc", "cat", "cta", "tac", "tca"]
  end

  it "should clear out repeated permutations" do
    string_permutations("obo").sort.should == ["boo", "obo", "oob"] 
  end

end
