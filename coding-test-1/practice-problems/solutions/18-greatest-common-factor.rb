# Write a method that takes in two numbers. Return the greatest
# integer that evenly divides both numbers. You may wish to use the
# `%` modulo operation, which is described in 15-is-prime.
#
# Difficulty: medium.

def greatest_common_factor(number1, number2)
  # start i at smaller of number1, number2
  i = nil
  if number1 <= number2
    i = number1
  else
    i = number2
  end

  while true
    if (number1 % i == 0) && (number2 % i == 0)
      return i
    end

    i -= 1
  end
end

puts("greatest_common_factor(3, 9) == 3: #{greatest_common_factor(3, 9) == 3}")
puts("greatest_common_factor(16, 24) == 8: #{greatest_common_factor(16, 24) == 8}")
puts("greatest_common_factor(3, 5) == 1: #{greatest_common_factor(3, 5) == 1}")
