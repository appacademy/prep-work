# Write a method that returns the `n`th prime number. Recall that only
# numbers greater than 1 can be prime.
#
# Difficulty: medium.

# You may use our `is_prime?` solution.
def is_prime?(number)
  if number <= 1
    # only numbers > 1 can be prime.
    return false
  end

  idx = 2
  while idx < number
    if (number % idx) == 0
      return false
    end

    idx += 1
  end

  return true
end

def nth_prime(n)
  prime_num = 0

  i = 2
  while true
    if is_prime?(i)
      prime_num += 1
      if prime_num == n
        return i
      end
    end

    i += 1
  end
end

puts("nth_prime(1) == 2: #{nth_prime(1) == 2}")
puts("nth_prime(2) == 3: #{nth_prime(2) == 3}")
puts("nth_prime(3) == 5: #{nth_prime(3) == 5}")
puts("nth_prime(4) == 7: #{nth_prime(4) == 7}")
puts("nth_prime(5) == 11: #{nth_prime(5) == 11}")
