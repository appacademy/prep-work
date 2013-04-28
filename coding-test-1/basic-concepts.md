# Basic Ruby Concepts

## Numbers

Know how to add, subtract, and multiply numbers in Ruby:

```ruby
3 + 3 == 6
3 * 4 == 12
4 - 3 == 1
8 / 2 == 4
```

## Variables

Know what a variable is and how to store and recall values.

A variable stores a value for later use. Know how to create and
assign to variables.

```ruby
# create variable, assign it 3
my_favorite_number = 3

# recall my_favorite_number, use it in an expression, save it
# to a variable
my_favorite_square = my_favorite_number * my_favorite_number
```

## Methods

Know what a method is, how to define one, how to return a value
from a method. Know how to call a method.

```ruby
# block of code that will take in a number, and return its
# square
def square(num)
  # squares num; the last expression in a method gets returned
  # implicitly
  num * num
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
  nil
end
```

## Conditionals

Know how to use if/elsif/else.

```ruby
def how_big(num)
  if num < 0
    "negative"
  elsif num < 10
    "pretty small"
  elsif num < 100
    "not too big"
  elsif num < 1000
    "plenty big"
  else
    "way too big"
  end
end
```

## Arrays

* Know what an array is.
* Know how to create one.
* Know how to access and set an element of the array.
* Know how to add elements to the end of an array.
* Know how to find the number of elements in an array

Arrays are lists of items. You can create an empty array like this

    empty_array = []

To create an array with some items, do like so:

    some_primes = [2, 3, 5, 7]

To fetch an item in the array, use its position. Positions start at zero.

    some_primes[0] == 2 # first prime
    some_primes[1] == 3 # second prime

To set the item at a position, do like so:

    some_primes[0] = 2 # set the first element of the array to 2

To add an element to the end of an array, use `<<`:

    some_primes << 11 # add the next prime to the array

To get the number of primes in an array, use the `count` method:

    [2, 3, 5, 7].count == 4

## Loops

* Know what a while loop is and how to use one.
* Know how to use a while loop to loop through the items in an
  array.

A while loop repeatedly executes a block as long as its
"condition" is true:

```ruby
while true # <<< "true" is the condition
  # loop forever
end
```

To loop through the items in an array, use an "index variable"
(often named `i`) and go one-by-one through the positions in the
array.

```ruby
i = 0
while i < items.count
  current_item = items[i]

  # Do something with current_item here...

  i += 1
end
```

## What you don't need

You won't need to know:

* Any special array methods
* Anything about hashes or dictionaries
* Anything about classes or objects.
* Importing files.
* Procs or blocks.
