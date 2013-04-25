require 'rspec'
require '09_scientific_notation'

# Write a method `sci_not(num) that converts a positive number > 1
# into scientific notation rounded to 2 decimal places
# (e.g. `sci_not(234.5) == "2.35E2"` (use "E" instead of "10^")).
#
# You may want to convert the integer input to a float: you can use
# `1.to_f`.
#
# My solution:

# (1) Repeatedly divide `num` by 10 until it is less than < 10. Record
#     how many times you did this.
# (2) Set `str = ""`
# (3) Tack on the `num` rounded to an integer (`#round`).
# (4) Tack on a "."
# (5) Multiple the number by 10; chop off the everything beyond the
#     tens part (check out the `%` remainder operator). Round to an
#     integer and tack this on.
# (6) Repeat for the second decimal digit.
# (7) Tack on "E" and the power.
#
# Difficulty: 4/5

describe "#sci_not" do
  it "should convert a single-digit int" do
    sci_not(3).should == "3.00E0"
  end

  it "should convert a simple integer" do
    sci_not(11).should == "1.10E1"
  end

  it "should convert an integer" do
    sci_not(12345).should == "1.23E4"
  end

  it "should convert a round-up situation" do
    sci_not(1249).should == "1.25E3"
  end
end
