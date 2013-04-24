# -*- coding: utf-8 -*-
require '04_wonky_coins'
require 'rspec'

# -*- coding: utf-8 -*-
describe "#wonky_coins" do
# Catsylvanian money is a strange thing… they have a coin for every denomination (including zero).  A wonky change machine in Catsylvania takes any coin of value N and returns 3 new coins, valued at N/2, N/3 and N/4 (rounded down).  Write a method wonky_coins that returns the number of coins you are left with if you take all non-zero coins and keep feeding them back into the machine until you are left with only zero-value coins.
# 2/5

  it "should handle a simple case" do
    wonky_coins(1).should == 3
  end

  it "should handle a larger case" do
    wonky_coins(5).should == 11 # ( 2, 1, 1 => 1, 0, 0, 0, 0, 0, 0, 0, 0, => 0,0,0,0,0,0,0,0,0,0,0, or 11 coins.
  end

end
