require '00_nearest_larger'
require 'rspec'

describe "#nearest_larger" do
# Write a function nearest_larger which takes an array and an index.  It returns the index of the nearest number in that array which is larger than the number at the inputted index.  Choose the earlier (left-most) number if there is a tie.  
# 1/5

  it "should handle a simple case to the right" do
    nearest_larger([2,3,4,8], 2).should == 3
  end

  it "should handle a simple case to the left" do
    nearest_larger([2,8,4,3], 2).should == 1
  end

  it "should treat any two larger numbers like a tie" do
    nearest_larger([2,6,4,8], 2).should == 1
  end

  it "should choose the left case in a tie" do
    nearest_larger([2,6,4,6], 2).should == 1
  end

  it "should return nil if no larger number is found" do
    nearest_larger( [2, 6, 4, 8], 3).should == nil
  end

end
