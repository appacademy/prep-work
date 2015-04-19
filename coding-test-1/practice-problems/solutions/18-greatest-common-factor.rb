# Write a method that takes in two numbers. Return the greatest
# integer that evenly divides both numbers. You may wish to use the
# `%` modulo operation.
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

# Here is an alternative algorithm (Euclidean Algorithm)
# to compute the greatest common factor (in recursive form).

def greatest_common_factor_2(number1,number2)
  if number1 < 1 || number2 < 1
    return nil
    
  elsif number1 % number2 == 0
    return number2
  elsif number2 % number1 == 0
    return number1
    
  elsif number1 > number2
    return greatest_common_factor_2(number1%number2, number2)
  elsif number2 > number1
    return greatest_common_factor_2(number2%number1, number1)
  end
  
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'greatest_common_factor(3, 9) == 3: ' +
  (greatest_common_factor(3, 9) == 3).to_s
)
puts(
  'greatest_common_factor(16, 24) == 8: ' +
  (greatest_common_factor(16, 24) == 8).to_s
)
puts(
  'greatest_common_factor(3, 5) == 1: ' +
  (greatest_common_factor(3, 5) == 1).to_s
)
