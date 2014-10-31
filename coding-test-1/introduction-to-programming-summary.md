# Introduction to Programming: Summary

You should first read (or at least skim) the Introduction to
Programming pages. Here's a quick recap of the various concepts you'll
want to be familiar with after reading.

Make sure to test your skills with the
[practice-problems][practice-problems] before starting the coding
challenge!

[practice-problems]: ./practice-problems

## Integers

Know how to add, subtract, and multiply numbers in Ruby:

```ruby
3 + 3 == 6
3 * 4 == 12
4 - 3 == 1
8 / 2 == 4
```

You also want to be familiar with the `%` modulo operator. This
returns the remainder when dividing a number:

```ruby
8 % 2 == 0
8 % 3 == 2
```

## Variables

Know what a variable is as well as how to store and recall values.

A variable stores a value for later use. Know how to create and
assign variables.

```ruby
# create variable, assign it 3
my_favorite_number = 3

# recall my_favorite_number, use it in an expression, save the result
# to a variable
my_favorite_square = my_favorite_number * my_favorite_number
```

## Basic Input/Output

You should know how to read a string in, and print a string out.

```ruby
puts("This string will be printed out")
puts("What is your name?")
name = gets.chomp
puts("Your name is " + name)
```

You should know about how `chomp` strips a newline from a string. You
should know how to use `+` to combine two strings (we call this
operation *concatenation*).

## Methods

Know what a method is, how to define one, and how to return a value
from a method. Know how to call a method.

```ruby
# block of code that will take in a number, and return its
# square
def square(num)
  # returns the result of squaring the number
  return num * num
end

square(3) == 9

# search for `target_item` in `items`; return the array index
# where it first occurs
def find_item(items, target_item)
  i = 0
  while i < items.count
    current_item = items[i]
    if current_item == target_item
      # found item; return its index; stop here and exit the
      # method
      return i
    end
    i += 1
  end

  # return nil to mean item not found
  return nil
end

find_item([1, 3, 5, 7], 5) == 2
```

## Conditionals

Know how to use if/elsif/else.

```ruby
def how_big(num)
  if num < 0
    return "negative"
  elsif num < 10
    return "pretty small"
  elsif num < 100
    return "not too big"
  elsif num < 1000
    return "plenty big"
  else
    return "way too big"
  end
end
```

Know how to use `&&` and `||`:

```ruby
i = 25
puts((i > 20) && (i < 30)) # prints true; both apply
puts((i > 100) || (i == 25)) # prints true; the second is true
```

## Arrays

* Know what an array is.
* Know how to create one.
* Know how to access and set an element of the array.
* Know how to add/remove elements to/from the end of an array.
* Know how to add/remove elements to/from the front of an array.
* Know how to find the number of elements in an array.
* Know how to use the `join` method.

```ruby
# Create an empty list
an_empty_list = []

# Create a list with some items in it:
some_primes = [2, 3, 5, 7]

# fetch items in an array using a position. Positions start at zero.
puts(some_primes[0] == 2) # prints true
puts(some_primes[1] == 3) # prints true

# Set an item at a position (some_primes[0] is already 2, so this example is redundant)
some_primes[0] = 2

# Add an element to the end of an array
some_primes.push(11)
puts(some_primes == [2, 3, 5, 7, 11]) # prints true

# Get the length of an array
puts(some_primes.length == 4) # prints true

# Remove the last element of an array
last_prime = some_primes.pop
puts(last_prime == 11) # prints true
puts(some_primes == [2, 3, 5, 7]) # prints true; 11 has been removed.

# Know how to remove an element at the front of an array
first_prime = some_primes.shift
puts(first_prime == 2) # prints true
puts(some_primes == [3, 5, 7]) # prints true; 2 has been removed

# Know how to add an element to the front of an array
some_primes.unshift(2)
puts(some_primes == [2, 3, 5, 7]) # prints true

# Know how to use the `join` method
["these", "are", "words"].join(" ") == "these are words"
["lasers", "racecars", "aeroplanes"].join(", ") == "lasers, racecars, aeroplanes"
```

## Strings

You should know that strings are similar to arrays:

```ruby
my_string = "Hello World!"
puts(my_string.length) # prints 12

i = 0
while i < my_string.length
  # prints out the letters of "Hello World" one-by-one, each on its own
  # line.
  puts(my_string[i])

  i = i + 1
end
```

You should know how to use the `String#split` method:

```ruby
"I am a sentence!".split == ["I", "am", "a", "sentence!"]
```

## Loops

* Know how to use a while loop to perform an action `n` times.
* Know how to use a while loop to loop through the items in an
  array.
* Know how to use break to exit a loop prematurely.

```ruby
# Loop 5 times.
i = 0
while i < 5
  # prints 0, 1, 2, 3, 4
  puts("This is iteration #" + i.to_s + "!")
  i = i + 1
end

# print the squares of some primes
some_primes = [2, 3, 5, 7]
i = 0
while i < some_primes.length
  puts(some_primes[i] * some_primes[i])
  i = i + 1
end

# Keep prompting user for a number until it is > 20
while true
  puts("Input a number greater than 20")
  number = gets.chomp.to_i

  if number > 20
    # break out of the loop
    break
  else
    puts("That wasn't big enough!")
  end
end

puts("Your big enough number is " + number.to_s)
```

## What you don't need

You won't need to know:

* Any special array methods
* Anything about hashes or dictionaries
* Anything about classes or objects.
* Importing files.
* Procs or blocks.
