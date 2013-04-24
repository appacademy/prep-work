require '07_rectangle_intersection'
require 'rspec'

describe "#rectangle_intersection" do
# Write a function rec_intersection that takes the bottom left and top right coordinate pairs for two rectangles and returns either the rectangle, line, or point of their intersection (a point can be represented as a rectangle with identical start and end points).  
# 3/5

  it "should handle a simple case" do
    rec_intersection( [[0,0],[2,1]] , [[1,0],[3,1]] ).should == [[1,0],[1,1]]
  end

  it "should be the smaller rectangle if engulfed completely" do
    rec_intersection( [[1,1],[2,2]] , [[0,0],[5,5]] ).should == [[1,1],[2,2]]
  end

  it "should return an empty array if there is no intersection" do
    rec_intersection( [[1,1],[2,2]] , [[4,4],[5,5]] ).should == []
  end

  it "should handle a more complex case" do
    rec_intersection( [[1,1],[5,4]] , [[2,2],[3,5]] ).should == [[2,2],[3,4]]
  end

end
