require '00_nearest_larger'
require 'rspec'

# Write a function, `nearest_larger(arr, i)` which takes an array and an
# index.  The function should return another index, `j`: this should
# satisfy:
#
# (a) `arr[i] < arr[j]`, AND
# (b) there is no `j2` closer to `i` than `j` where `arr[i] < arr[j2]`.
#
# In case of ties (see example below), choose the earliest (left-most)
# of the two indices. If no number in `arr` is larger than `arr[i]`,
# return `nil`.
#
# Difficulty: 2/5

describe "#nearest_larger" do
  it "handles a simple case to the right" do
    nearest_larger([2,3,4,8], 2).should == 3
  end

  it "handles a simple case to the left" do
    nearest_larger([2,8,4,3], 2).should == 1
  end

  it "treats any two larger numbers like a tie" do
    nearest_larger([2,6,4,8], 2).should == 1
  end

  it "should choose the left case in a tie" do
    nearest_larger([2,6,4,6], 2).should == 1
  end

  it "handles a case with an answer > 1 distance to the left" do
    nearest_larger([8,2,4,3], 2).should == 0
  end

  it "handles a case with an answer > 1 distance to the right" do
    nearest_larger([2,4,3,8], 1).should == 3
  end

  it "should return nil if no larger number is found" do
    nearest_larger([2, 6, 4, 8], 3).should == nil
  end

  it "should return the nearer of two greater numbers" do
    nearest_larger([2, 6, 9, 4, 8], 3).should == 2
  end
end
