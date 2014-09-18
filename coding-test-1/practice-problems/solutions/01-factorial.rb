# Write a method that takes an integer `n` in; it should return
# n*(n-1)*(n-2)*...*2*1. Assume n >= 0.
#
# As a special case, `factorial(0) == 1`.
#
# Difficulty: easy.

def factorial(n)
  if n < 0
    return nil
  end

  result = 1
  while n > 0
    result = result * n

    n -= 1
  end

  return result
end

puts("factorial(0) == 1: #{factorial(0) == 1}")
puts("factorial(1) == 1: #{factorial(1) == 1}")
puts("factorial(2) == 2: #{factorial(2) == 2}")
puts("factorial(3) == 6: #{factorial(3) == 6}")
puts("factorial(4) == 24: #{factorial(4) == 24}")
