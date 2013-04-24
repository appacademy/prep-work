require '02_letter_count'
require 'rspec'

describe "#letter_count" do
# Write a function letter_count that takes a string of words and returns a hash listing each letter and its frequency
# 1/5
  
  it "should handle a simple case" do
    letter_count("cat").should == {"c" => 1, "a" => 1, "t" => 1 }
  end

  it "should handle multiple of the same letter" do
    letter_count("moon").should == { "m" => 1, "o" => 2, "n" => 1 }
  end

  it "should handle a complex case" do
    letter_count("cats are fun").should == { "a" => 2, "c" => 1, "e"=> 1, "f" => 1, "n" => 1, "r" => 1, "s" => 1, "t" => 1, "u" => 1 }
  end
  
end
