require 'rspec'
require '09_scientific_notation'

describe "#sci_not" do
# Write a method sci_not that converts a positive integer or positive decimal into scientific notation rounded to 2 decimal places (e.g. sci_not(.2345) == "2.35E-1"  (use "E" instead of "10^"))
# 3/5
  
  it "should convert a single-digit int" do
    sci_not(3).should == "3.0E0"
  end

  it "should convert a single-digit decimal" do
    sci_not(1.2345).should == "1.23E0"
  end

  it "should convert a simple integer" do
    sci_not(11).should == "1.1E1"
  end

  it "should convert an integer" do
    sci_not(12345).should == "1.23E4"
  end

  it "should convert a simple decimal" do
    sci_not(0.12345).should == "1.23E-1"
  end

  it "should convert a complex decimal" do
    sci_not(0.000123).should == "1.23E-4"
  end

  it "should convert a round-up situation" do
    sci_not(1.249).should == "1.25E0"
  end

  it "should convert a mixed number" do
    sci_not(12345.6789).should == "1.23E4"
  end

end
