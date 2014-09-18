# Write a method that takes in a number and returns true if it is a
# power of 2. Otherwise, return false.
#
# Difficulty: medium.

def is_power_of_two?(num)
  if num == 0
    return false
  end

  while true
    if num == 1
      return true
    elsif num % 2 == 0
      num = num / 2
    else
      return false
    end
  end
end

puts("is_power_of_two?(1) == true: #{is_power_of_two?(1) == true}")
puts("is_power_of_two?(16) == true: #{is_power_of_two?(16) == true}")
puts("is_power_of_two?(64) == true: #{is_power_of_two?(64) == true}")
puts("is_power_of_two?(78) == false: #{is_power_of_two?(78) == false}")
puts("is_power_of_two?(0) == false: #{is_power_of_two?(0) == false}")
