require '05_morse_code'
require 'rspec'

describe "#morse_encode" do
# Build a function morse_encode that takes in a word (no numbers or punctuation) and outputs the morse code for it.  http://www.w1wc.com/pdf_files/international_morse_code.pdf  Put two spaces between words and one space between letters.  
# 2/5

  it "should do a simple letter" do
    morse_encode("q").should == "--.-"
  end

  it "should handle a small word" do
    morse_encode("cat").should == "-.-. .- -"
  end

  it "should handle a phrase" do
    morse_encode("cat in hat").should == "-.-. .- -  .. -.  .... .- -"
  end

end
