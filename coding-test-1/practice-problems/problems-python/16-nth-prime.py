# Write a method that returns the `n`th prime number. Recall that only
# numbers greater than 1 can be prime.
#
# Difficulty: medium.

# You may use our `is_prime` solution.
def is_prime(number):
  if number <= 1:
    # only numbers > 1 can be prime.
    return False

  idx = 2
  while idx < number:
    if (number % idx) == 0:
      return False

    idx += 1

  return true

def nth_prime(n):
  pass

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

print 'nth_prime(1) == 2: ' + str(nth_prime(1) == 2)
print 'nth_prime(2) == 3: ' + str(nth_prime(2) == 3)
print 'nth_prime(3) == 5: ' + str(nth_prime(3) == 5)
print 'nth_prime(4) == 7: ' + str(nth_prime(4) == 7)
print 'nth_prime(5) == 11: ' + str(nth_prime(5) == 11)
