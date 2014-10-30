# Introduction to Programming: III

## Adding or Removing From Arrays

Arrays would be boring if you could never change them. Luckily, there
are methods to add and remove items to/from an array.

To add an item to the end of an array, use the `push` method. We can
use it like so:

```ruby
cool_things = []

# Continue to prompt the user for cool things until we have three of
# them.
while cool_things.length < 3
  puts("Tell me a cool thing!")
  one_cool_thing = gets.chomp
  # This adds one item at the end of the array.
  cool_things.push(one_cool_thing)
end

# If the user types in "Racecars", "Lasers", and "Aeroplanes", then:
#    cool_things == ["Racecars", "Lasers", "Aeroplanes"]
# because each subsequent item is `push`ed onto the end of the array.

puts("Here's some cool things in backward order:")

# Loop through and print each of the cool things.
idx = cool_things.length - 1
while idx >= 0
  puts(cool_things[idx])
  idx = idx - 1
end

# This would print "Aeroplanes", "Lasers", "Racecars", because we're
# working backwards.
```

The opposite of adding items at the end of the array is to add them at
the start of the array. To do this, use the `unshift` method:

```ruby
cool_things = []

# Continue to prompt the user for cool things until we have three of
# them.
while cool_things.length < 3
  puts("Tell me a cool thing!")
  one_cool_thing = gets.chomp
  # This adds one item at the beginning of the array.
  cool_things.unshift(one_cool_thing)
end

# If the user types in "Racecars", "Lasers", and "Aeroplanes", then:
#    cool_things == ["Aeroplanes", "Laser", "Racecars"]
# because each subsequent item is `unshift`ed onto the front of the
# array.

puts("Here's some cool things in backward order:")

# Loop through and print each of the cool things.
idx = 0
while idx < cool_things.length
  puts(cool_things[idx])
  idx = idx + 1
end

# This prints the array out in order of increasing position, which is
# the opposite of the order the items were typed in.
```

Just as we can add items from the start or end of an array, we can
remove items from an array using `shift` (remove from the beginning)
and `pop` (remove from the end).

```ruby
arr = [2, 3, 5, 7]

# prints 2, the item at position zero
puts(arr[0])
# remove 2 from the array
item = arr.shift
# prints 2
puts(item)
# prints true; the leading 2 element is removed
puts(arr == [3, 5, 7])

# reset arr
arr = [2, 3, 5, 7]
# prints 7, the last item of the array
puts(arr[3])
# remove 7 from array
item = arr.pop
# prints 7
puts(item)
# prints 3, since there are only three items left
puts(arr.length)
# prints true; only the seven is removed
puts(arr == [2, 3, 5])
```

## Setting Positions in an Array

Just as you can use `arr[idx]` to get the object stored at a position,
you can use `arr[idx] = value` to set the object stored at a position:

```ruby
arr = [2, 3, 5]
arr[1] = "three"
# prints true
puts(arr == [2, "three", 5])
```

Lastly, what happens if you try to access a position past the last
index in an array?

```ruby
arr = [2, 3, 5, 7]

# All of these are cool
puts(arr[0])
puts(arr[1])
puts(arr[2])
puts(arr[3])
# Output:
#   2
#   3
#   5
#   7

# This also works! This prints a blank line.
puts(arr[4])
```

In some languages, `arr[4]` is an error, since nothing is stored at
position 4. In Ruby, it is okay; Ruby returns a special object, `nil`,
which means "nothing". Because nothing is stored at the fourth
position, `nil` is an appropriate answer. `puts(nil)` prints just a
blank line.

Even though Ruby will not crash your program, it is normally an
indication of a mistake to try to access positions beyond the end of
an array. I can't think of any reason why you would want to do it.

## Strings Are Like Arrays

In a way, strings are similar to arrays. Arrays represent sequences of
objects; strings are sequences of characters. Just like arrays,
strings have a length:

```ruby
puts("ringo".length)
# Output
#   5
```

Just like you can get the 3rd item of an array by writing `arr[2]`,
you can get the third letter of a string by writing `str[2]`:

```ruby
str = "abcd"

idx = 0
while idx < str.length
  puts(str[idx])
  idx = idx + 1
end

# Output
#   a
#   b
#   c
#   d
```

Note that even though strings are similar to arrays of letters, they
are not really the same:

```ruby
# prints false!
puts("abc" == ["a", "b", "c"])
```

## Splitting a String; Joining an Array

Sometimes you would like to split a string into several strings, one
per word:

```ruby
"this is a sentence".split == ["this", "is", "a", "sentence"]
```

Likewise, we can do the reverse, and merge an array of strings into
one string:

```ruby
# the argument to join is called a **separator**
["this", "is", "a", "sentence"].join(" ") == "this is a sentence"
# this puts a ", " between each of the cool things.
["racecars", "lasers", "aeroplanes"].join(", ") == "racecars, lasers, aeroplanes"
```

These methods are very useful when you have to work word-by-word.

## Writing Your Own Methods

Oftentimes you'll want to repeat some code multiple times:

```ruby
# This prints several strings, three times each.

name = "Gizmo"
idx = 0
while idx < 3
  puts(name)
  idx = idx + 1
end

name = "Earl"
idx = 0
while idx < 3
  puts(name)
  idx = idx + 1
end

name = "Markov"
idx = 0
while idx < 3
  puts(name)
  idx = idx + 1
end
```

This is very repetitious. Instead, we can write a new method, named
`print_three_times`:

```ruby
# First, **define** the method:
def print_three_times(name)
  idx = 0
  while idx < 3
    puts(name)
    idx = idx + 1
  end
end

# Nothing is printed yet

# Now we print each name three times.
print_three_times("Gizmo")
print_three_times("Earl")
print_three_times("Markov")
```

We **define** a new method by writing `def` followed by the method
name. Methods can take input; in this case our `print_three_times`
method should take as input a name to print three times.

Between the `def` line and the `end` is the **body** of the
method. The body **is not yet** run when the method is defined. The
body describes what to do when someone **calls** the
`print_three_times` method.

We call the method by writing `print_three_times("Gizmo")`. This tells
Ruby to start running the code in the body of the `print_three_times`
method. Also, because we put `"Gizmo"` between the parentheses, the
`name` variable will be set to the string `"Gizmo"`.

Sometimes a method should do some work, and then **return** a value
back to the caller.

```ruby
# The caller will give the input `number_of_squares`; this method will return an array
# consisting of the squares for numbers from 0 up until the number specified by 'number_of_squares'.
def first_square_numbers(number_of_squares)
  squares = []

  idx = 0
  while idx < number_of_squares
    squares.push(idx * idx)
    idx = idx + 1
  end

  return squares
end

puts("How many square numbers do you want?")
number_of_desired_squares = gets.to_i
squares = first_square_numbers(number_of_desired_squares)

idx = 0
while idx < squares.length
  puts(squares[idx])
  idx = idx + 1
end

# Output:
#   How many square numbers do you want?
#   7
#   0
#   1
#   4
#   9
#   16
#   25
#   36
```

By using `return` in `first_square_numbers`, we're saying that
whenever we call `first_square_numbers`, the body will be run. When we
get to a return statement, the returned value will be sent back to the
caller. So:

    squares = first_square_numbers(7)

is like writing

    squares = [0, 1, 4, 9, 16, 25, 36]

## Breaking Out of Loops

Let's write some code that finds an item in an array and prints its
position:

```ruby
puts("Please type GIZMO")

while true
  input = gets.chomp
  if input == "GIZMO"
    break
  end

  puts("Try typing GIZMO again!")
end

puts("THANKS FOR TYPING GIZMO")
```

The `break` command tells Ruby to "break out of" the loop early.
Normally `while true` is an infinite loop. The test will always return
true, so we can't get out of the loop that way. However, if the user
types "GIZMO", we'll reach the `break` statement, which will "break us
out" of the loop. We'll jump to the first line after the `end`.

## Returning Early

Consider this example:

```ruby
def say_hello(number_of_times)
  while number_of_times != 0
    puts("Hello!")
    number_of_times = number_of_times - 1
  end
end

# says hello five times.
say_hello(5)

# Enters an infinite loop; `number_of_times` will start out already
# less than zero, so in `say_hello`, when we decrease `number_of_times`
# in the while loop, we'll never hit zero.
say_hello(-10)
```

There are a number of ways to fix this problem. Let's see one:

```ruby
def say_hello(number_of_times)
  if number_of_times < 0
    puts("That is an invalid number of times!")
    # `return` ends the function right here!
    return
  end

  while number_of_times != 0
    puts("Hello!")
    number_of_times = number_of_times - 1
  end
end

# Doesn't say hello at all; never gets to the loop.
say_hello(-10)
```

By using `return`, we can prematurely end the function. That way we
never enter the loop at all.

Let's see another example, which returns the smallest square greater
than a given lower bound.

```ruby
def smallest_square(lower_bound)
  i = 0
  while true
    square = i * i

    if square > lower_bound
      return square
    end

    i = i + 1
  end
end

puts(smallest_square(10))
# Output:
#   16
```

Inside the function we enter an infinite loop; but we'll break out of
both it and the function when we hit the `return` statement as soon as
we reach a square greater than the lower bound.

## The End!

This completes our introduction to Ruby. There's a lot more to Ruby
than what we've covered here. Probably the biggest thing we've skipped
is how to define new Ruby **classes**; we've only used integers,
strings and arrays, but you can write your own new types of objects.
We've also not talked about the `Hash` class, or "blocks" in Ruby.

However, **you won't need to know those things to do well on the
coding challenge**. What've you've learned is a great start; if you've
followed along, you're in great shape to start the exercises that will
prepare you for the coding challenge.

**Now do the [practice problems][practice-problems] we've provided
before the coding challenge**. You want to practice so that you do
your best.

If you would like to review the Introduction to Programming Minibook,
a recap of the various topics are available here: [Introduction To
Programming Summary][intro-to-programming-summary].

Good luck!

[intro-to-programming-summary]: ./introduction-to-programming-summary.md
[practice-problems]: ./practice-problems
