# Example Problems

These questions are good examples of what you may encounter on the
coding challenge. You should read each question and try to solve them
for yourself.

Some of these examples are harder than the problems you will encounter
on the challenge, but the concepts are all relevant. You should
understand the solutions to these problems.

## Questions

**Q1**: Write a method, `pow`, that takes two (non-negative, integer)
numbers, `base` and `exponent` and returns `base` raised to the
`exponent` power. (No fair using Ruby's `base ** exponent` notation!).

**Q2**: Write a method, `sum` which takes an array of numbers and
returns the sum of the numbers.

**Q3**: Write a method, `is_prime?`, that takes a number `num` and
returns `true` if it is prime and `false` otherwise.

You may wish to use the modulo operation: `5 % 2` returns the
remainder when dividing 5 by 2: 1. If `num` is divisible by `i`, then
`num % i == 0`. (You would not be expected to already know about
modulo for the challenge)

**Q4**: Using your `is_prime?` method, write a new method, `primes` that
takes a (non-negative, integer) number `max` and returns an array of
all prime numbers less than `max`.

## Solutions

**Q1**: `pow`

```ruby
def pow(base, exponent)
  result = 1

  i = 1
  while i <= exponent
    result = result * base
    i += 1
  end

  result
end
```

**Q2**: `sum`

```ruby
def sum(nums)
  total = 0

  i = 0
  while i < nums.count
    total += nums[i]

    i += 1
  end

  # return total
  total
end
```

**Q3**: `is_prime?`

```ruby
# Works for values greater than 1

def is_prime?(num)
  i = 2
  while i < num
    is_divisible = ((num % i) == 0)

    if is_divisible
      # divisor found; stop and return false!
      return false
    end

    i += 1
  end

  # no divisors found
  true
end
```

**Q4**: `primes`

```ruby
def primes(max)
  primes_arr = []

  i = 2
  while i < max
    if is_prime?(i)
      # i is prime; add it to the array
      primes_arr << i
    end

    i += 1
  end

  # return primes_arr
  primes_arr
end
```
