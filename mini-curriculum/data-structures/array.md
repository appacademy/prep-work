# Arrays

## Goals

* Familiarize yourself with the selected, important methods here.
* Know:
  * how to create an array literal
  * how to access items by index
  * how to set an item at an index
  * how to perform a block on each element
* Know how to name arrays appropriately.
* Know why not to mix items in an array.

## Creating arrays

Arrays store sequences of objects. There are a few ways to create an
array:

```ruby
empty_array = Array.new
another_empty_array = [] # this is the preferred way, and much easier!

some_squares = [4, 9, 16]
some_fruits = ["pear", "apple", "banana"]
```

## Accessing items by index

The objects are stored by incrementing indices starting at zero (i.e.,
0, 1, 2, 3, etc.). We look up an item by *index*. For example:

```ruby
some_fruits = ["pear", "apple", "banana"]
puts some_fruits[0]
# => "pear"

# how would you get the second item?

# arr.length returns the number of elements in an array
# `arr`. What index do you use to get the last element in an
# array?
```

If you want to get multiple consecutive items from an array, you can
do that using a `Range`:

```ruby
some_fruits[0..1]
# 0..1 is the range from 0 to 1
# => ["pear", "apple"]
```

Three periods - '...' - can also be used to define a Range, but this leaves off the last element in the return array.

```ruby
example = [1, 2, 3, 4, 5]
example[2..4]
# => [3, 4, 5]
example[2...4]
# => [3, 4]
```

You can also use -1 as the end value (-2 as the second to last value, etc.) of a `Range` to specify the last index of the array:

```ruby
example = [5, 3, 2, 1, 55]
example[2..-1]
# => [2, 1, 55]
```


## Accessing elements in order

We can also use an *iterator* if we want to access all of the elements
of an array:

```ruby
cool_things = ["race cars", "lasers", "aeroplanes"]
cool_things.each do |cool_thing|
  puts "I like #{cool_thing}!"
end
# prints: I like race cars!
#         I like lasers!
#         I like aeroplanes!
```

### Don't modify array while iterating

**You must never modify an array while iterating through it**; strange
things will happen. An analogous `while` iteration through the loop
might help explain the problem:

```ruby
array = [0, 1, 2, 3]
i = 0
while i < array.count
  array.delete_at(i)
  i += 1
end
```

You may think this will delete all elements in the array. But take it
one step at a time. The first time through the loop, `array[0]` is
deleted, and everything in the array shifts over one position; `array
== [1, 2, 3]`. `i` is then incremented; we next try to delete
`array[1]`. But this is not the element `1`, but instead `2` because
of the shifting.

Likewise, if you modify items in an array you are iterating through,
you are asking for pain and confusing errors. Don't do it.

If you want to change an array's value while iterating, consider the map function.

One alternative to delete multiple elements of an array without
iteration is [`#delete_if`][rdoc-delete-if].

[rdoc-delete-if]: http://www.ruby-doc.org/core-1.9.3/Array.html#method-i-delete_if

## Setting and adding elements

You can set the element at an index like so:

```ruby
cool_things = ["race cars", "lasers", "aeroplanes"]
cool_things[1] = "jets"
puts cool_things
# => ["race cars", "jets", "aeroplanes"]
```

It's not super common to set items in the middle of an array, but it
is quite common to add items to the end of an array.

```ruby
fruits = []
fruits << "pear"
fruits << "apple"
fruits << "banana"
puts fruits
# => ["pear", "apple", "banana"]
```

The method `<<` is called the *shovel* operator. It shovels things
into the array.

Less commonly, you may want to *concatenate* two arrays:

```ruby
some_numbers = [1, 3, 5]
more_numbers = [7, 9, 11]

all_numbers = some_numbers + more_numbers
# => [1, 3, 5, 7, 9, 11]
```

Notice that the `+` method creates a new array; it doesn't modify
either of the two other arrays. Broadly, there are two types of
methods: ones which modify the object (like `<<`) and ones that create
and return a new object (like `+`). When learning new methods,
remember to note whether it returns a new object or modifies the
existing object.

Because of the overhead involved in creating a new array just to
assign it to the same variable, if you just want to modify the
original array, you may want to use the `concat` method which will do
this for you. This isn't worth worrying about until you diagnose a
real life performance problem, but it may help you understand how `+`
works.

(There are also some other methods, like `each`, that are used for
their *side-effects*; they neither modify the object or return a new
value.)

## Array size

There are two main ways to get an array's size, or length:

```ruby
[1, 2, 3].count
# => 3
[].empty?
# => true
```

Note that `arr.empty?` is equivalent to `arr.count == 0`. Why use
`empty?`? Because it expresses the purpose of the statement more
clearly and succinctly; always prefer code that is expressive.

## push and popping

It is often common to use arrays in a last-in, first-out (LIFO) way. This is
called *pushing* (adding to the end of the array), and *popping* (removing
from the end). To push an element into an array, use the shovel (`<<`); to pop
an element from an array, use the `pop` method. Using Array's `push` and
`pop`, we can treat an array like a
[*stack*](http://stackoverflow.com/questions/3825050/what-do-push-and-pop-mean-for-stacks#answer-3825329),
a data type that helps us solve problems that have LIFO features. One such
problem is reverse polish calculation (remember the RPN calculator from Test
First Ruby?):



```ruby
# computes (1 (2 3 +) *)
nums = []

nums << 1
nums << 2
nums << 3

nums << (nums.pop) + (nums.pop)
nums << (nums.pop) * (nums.pop)
```

## using array as a queue

It is sometimes useful to use arrays in a first-in, first-out way (FIFO). Usually
this is called "queue" and "dequeue". Using Array's `push` and
`delete_at(0)`, we can treat an array like a [*queue*](http://en.wikipedia.org/wiki/Queue_(abstract_data_type),
a datatype that helps us solve problems with FIFO features.

```ruby
nums = []

nums << 1
nums << 2
nums << 3

nums.delete_at(0)
# => 1

nums
# => [2, 3]
```

## shift and unshift

Shift and unshift are the opposite of pop and push, respectively.
Shift removes the first element from the array and returns that element.
Unshift pushes a new element into the front of the array and returns the modified array.

Example:
```ruby
array = [1,2,3,4]
array.shift
# => 1

array
# => [2,3,4]

array.unshift(5)
# => [5,2,3,4]
```

Can you use a stack to reverse a string? You will need `String#split`
and `Array#join`.

## Turning arrays to strings: join

It is very common to want to represent an array as a string.

```ruby
cool_things = ["race cars", "lasers", "aeroplanes"]
"Things I like include #{cool_things.join(", ")}."
# => "Things I like include race cars, lasers, aeroplanes."
```

NB: We use *string interpolation* to execute the code inside the `#{}`
and insert it inside the string. You can see the
[string tutorial](string.md#interpolation) for more details.

The argument to `join` (`", "` in the example) is called the
*separator*. It's used to separate the items in the string.

## Finding elements

Elements are usually either accessed in order (`arr.each`), or by
position (`arr[i]`). Less commonly, you may want to find whether an
array contains an object:

```ruby
small_primes = [1, 2, 3, 5, 7, 11]
small_primes.include?(9)
# => false
```

The index method returns the position of the first occurrence of an
item in the array:

```ruby
small_primes.index(3)
# => 2
small_primes.index(9)
# => nil
```

You may notice that the last example returns `nil`. Returning `nil` is
idiomatic when no other value is appropriate; `nil` is Ruby's way to
say "nothing". (Of course, this could be confusing if we put `nil`
into the array ourselves; best to use `include?` to check for
membership).

## Sorting an array

To sort an array in ascending order, use the `sort` method:

```ruby
arr = [3, 2, 1]

sorted_arr = arr.sort
sorted_arr # => [1, 2, 3]
arr # => [3, 2, 1]
```

Notice that `sort` returns a new, sorted array. To sort an array *in
place*, modifying the existing array to contain the elements in order,
use the `sort!` method:

```ruby
arr = [3, 2, 1]

arr.sort!
arr # => [1, 2, 3]
```

A common idiom in Ruby are pairs of *safe* and *unsafe* methods; the
unsafe methods normally end in '!'. What it means to be unsafe varies
from method to method, but often the unsafe version will modify the
object, while the safe version will return a new value. Oftentimes the
unsafe version is faster, because it only needs to modify an existing
object. However, use the safe version as a default, and only use
unsafe methods when you have a reason. Again, don't worry about speed
until you see a performance problem in real life.

## Shuffling an array

To shuffle an array in random order, use the `shuffle` method:

```ruby
[1, 2, 3].shuffle
# => [2, 1, 3]
```

##  Access first and last elem in arrays

The `first` method selects the first elem in the array. The `last` method selects the last elem in the array. This can be pretty useful.

```ruby

die = [1,2,3,4,5,6]
die.first
# => 1
die.last
# => 6
```

##  Random (discrete uniform) sampling from arrays

The `sample` method selects an element at random from the array where each element has equal probability of being selected.  This does not alter the array.

```ruby

die = [1,2,3,4,5,6]
roll1 = die.sample
roll2 = die.sample
```

## Naming arrays

Array variable names are typically pluralized, to indicate that the
variable holds an array which may hold many objects. For instance, an
array that holds `Car` objects may be called `cars`. If, while
iterating through an array (often with `each`), I store a single
element from the array in a variable, it is very typical to name that
variable with the singular form of the object.

```ruby
fancy_car_brands = ["Maserati", "Porsche", "Tesla"]
junk_models = ["Chevy Nova", "Ford Pinto"]
fancy_car_brands.each do |fancy_car_brand|
  junk_models.each do |junk_model|
    puts "#{fancy_car_brand} would never make junk like the #{junk_model}"
  end
end
```

Choosing appropriate names is one of the most important ways to
improve code legibility. Compare to this:

```ruby
fc = ["Maserati", "Porsche", "Tesla"]
jc = ["Chevy Nova", "Ford Pinto"]
fc.each do |c1|
  jc.each do |c2|
    puts "I like a #{c1} better than a #{c2}"
  end
end
```

Choosing good names can take a bit of thought, but it is super
important to do. Poor naming makes code very confusing, which means
you'll end up with more bugs. Also, other engineers don't like to work
with confusing code, and you want people to like working with you :-)

## Arrays should always contain one type of thing

You can create arrays that hold different kinds of things:

```ruby
mish_mosh = ["Race cars", 42, { :name => "Gizmo", :species => "cat" }]
```

These are called *heterogeneous* arrays (from Greek for "different
kinds"). Arrays like `mish_mosh` are a mess, because they contain a
grab bag of unrelated items. You will seldom want to create an array
like this; create arrays that have one kind of thing:

```ruby
cool_things = ["Race cars", "lasers", "aeroplanes"]
lucky_numbers = [3, 7, 42]
animals = [
  {:name => "Gizmo", :species => "cat"},
  {:name => "Maurice", :species => "fish"}
]
```

Collections of items should have some unifying principal: in the three
arrays here every element is a cool thing, or a lucky number, or an
animal. Collections with heterogeneous types often lack a unifying
idea.

Finally, heterogeneous are difficult to work with because you never
know what kind of object you might encounter in the array. Is it a
`String` and you can call `.upcase` on it? Or is it a number; will it
be safe to add to it? A hash?

## Exercises

Estimated time: 2hrs

### Remove dups

Array has a `uniq` method that removes duplicates from an array. It
returns the unique elements in the order in which they first appeared:

```ruby
[1, 2, 1, 3, 3].uniq # => [1, 2, 3]
```

Write your own `uniq` method, called `my_uniq`; it should take in an
Array and return a new array. It should not call `uniq`.

One special feature of Ruby classes is that they are *open*; we can
add new methods to existing classes. Here, add your `my_uniq` method
to Array:

```ruby
class Array
  def my_uniq
    # ...
  end
end
```

This is also called *monkey patching*, and it is often frowned upon
to, after-the-fact, add new methods to a class. However, it is
occasionally useful and interesting to try out.

### Two sum

Write a method that finds if an array of numbers has a pair that sums
to zero. Be careful of the case of zero; there need to be two zeroes
in the array to make a pair that sums to zero.

### Towers of Hanoi

Write a
[Towers of Hanoi](http://en.wikipedia.org/wiki/Towers_of_hanoi) game.

Keep three arrays, which represents the piles of discs. Pick a
representation of the discs to store in the arrays; maybe just a
number representing their size.

In a loop, prompt the user (using
[gets](http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp/))
and ask what pile to select a disc from, and where to put it.

After each move, check to see if they have succeeded in moving all the
discs, to the final pile. If so, they win!

### My Transpose

To represent a *matrix*, or two-dimensional grid of numbers, we can
write an array containing arrays which represent rows:

```ruby
rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]

row1 = rows[0]
row2 = rows[1]
row3 = rows[2]
```

We could equivalently have stored the matrix as an array of
columns:

```ruby
cols = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
```

Write a method, `my_transpose`, which will convert between the
row-oriented and column-oriented representations.

## Resources
* [Ruby Doc on Array](http://www.ruby-doc.org/core-1.9.3/Array.html)
* [Ruby Monk Intro to Arrays](http://rubymonk.com/learning/books/1/chapters/1-arrays/lessons/2-arrays-introduction)
* [Ruby Array Article](http://zetcode.com/lang/rubytutorial/arrays/)
