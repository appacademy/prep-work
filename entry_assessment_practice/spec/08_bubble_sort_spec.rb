require '08_bubble_sort'
require 'rspec'

describe "#bubble_sort" do
# Write a function Array.bubble_sort which will sort an array of integers using the "bubble sort" methodology. (http://en.wikipedia.org/wiki/Bubble_sort)
# 3/5

  it "works with an empty array" do
    [].bubble_sort.should == []
  end

  it "works with an array of one item" do
    [1].bubble_sort.should == [1]
  end

  it "sorts numbers" do
    [5, 4, 3, 2, 1].bubble_sort.should == [1, 2, 3, 4, 5]
  end

  it "does not modify original" do
    original = [5, 4, 3, 2, 1]
    duped_original = original.dup
    duped_original.bubble_sort
    duped_original.should == original
  end

end
