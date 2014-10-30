# Introduction to Programming: II

## What Are Methods?

At this point, we've seen a number of **methods**:

* `+`
* `-`
* `*`
* `/`
* `puts`
* `gets`
* `to_i`
* `to_s`
* `chomps`

Methods are the "verbs" of Ruby. Numbers and strings are the
"nouns". When you call a method, it does something to one or more
objects.

We saw that when you **call** (or **invoke**) the `to_i` or `to_s`
method, you call them on an object:

```ruby
# Invoke the method `to_i` on the object `"7"`:
"7".to_i
# Invoke the method `to_s` on the object `42`:
42.to_s
```

When we call a method, we always use the format `object.method`. To
the left of the dot is the noun, to the right of the dot is the verb.

Even the arithmetic operations we've been using are methods. We've
been writing them in a shortcut format, but we could call the
arithmetic operations a more verbose and traditional way, too:

```ruby
# Equivalent to 5 + 5
ten = 5.+(5)
# Equivalent to 9 - 2
seven = 9.-(2)
# Equivalent to 4 * 3
twelve = 4.*(3)
# Equivalent to 8 / 4
two = 8./(4)
```

Even `puts` and `gets` are methods. When you call them, the object is
**implicit**, which means we can leave it out. You don't need to know
about that right now: you can consider `puts` and `gets` to be special
methods.

## Comparisons

Ruby gives you methods to compare objects:

```ruby
puts(3 < 4)
puts(5 > 10)

# Output:
#   true
#   false
```

The `<` and `>` methods return `true` or `false`. Note that `true` is
different from `"true"` and `false` is different from
`"false"`. `true` and `false` are not strings; they are special Ruby
objects representing truth or falsity.

We can also use the `==` and `!=` methods to tell whether two objects
are equal:

```ruby
puts(3 == 4)
puts(4 != 5)
puts("Three" == "Three")

# Output:
#   false
#   true
#   true
```

A very common mistake in Ruby is to write `=` when we mean
`==`. Remember: `=` assigns a variable, while `==` compares two
objects.

## If, Else, and Elsif

Now that we have started talking about comparisons, we should talk
about code branching. Code branching is what allows your program to do
different things depending on different conditions:

```ruby
puts("Type in a number")

# In one line, we use `gets` to read a string from the user, then
# immediately call `to_i` on the string to return an integer.
num = gets.to_i

if num < 10
  puts("That's not a big number!")
end

puts("Thanks for typing in a number!")
```

The `if` has two parts: the **test** (`num < 10`) and the **body**
(`puts("That's not a big number!")`). The test should be a Ruby
expression that returns `true` or `false`. The body can be multiple
lines long. The special keyword `end` indicates the end of the body.

If the test is true, Ruby will run the code in the body. If the test
is false, Ruby will skip it. In this example, if the user types a
number less than ten, the program will tell them it is not a big
number. Regardless whether the number is big or small, the program
will thank them.

When using `if`, always **indent** the body. This makes it easier to
see the start and end of the body. When you start out, indenting might
seem like a chore, but it really helps with visual organization as you
write increasingly more complex programs.

It is very typical to want to have two branches of code: one if a test
is true, the other if the test is false. We can do this like so:

```ruby
puts("Type in a number")
num = gets.to_i

if num < 10
  puts("That's not a big number!")
else
  puts("Wow, that's a big number!")
end

puts("Thanks for typing in a number!")
```

By using the `else` keyword, we can create a second body that will be
run only if the test is false.

Lastly, we can get even more sophisticated and offer more branches:

```ruby
puts("Type in a number")
num = gets.to_i

if num < 10
  puts("That's not a big number!")
elsif num < 100
  puts("That's a pretty big number")
elsif num < 1000
  puts("Wow that's a large number")
else
  puts("Holy cow, that number is blowing my mind")
end

puts("Thanks for typing in a number!")
```

Each `elsif` introduces a new test and a new body. Note that if the
user enters the number 9, only the first body will run, even though `9
< 100` and `9 < 1000`. An `elsif` test is evaluated only if all the
previous tests returned false. The `else` still applies if all tests
failed. The `else` always comes last.

## Logical Connectives

Sometimes you want to do something if X is true AND if Y is true. In
that case use the `&&` method:

```ruby
puts("Input a number!")

number = gets.to_i
if (number > 10) && (number < 20)
  puts("Your number was greater than ten AND less than twenty!")
else
  puts("Your number was either less than ten, OR greater than twenty!")
end
```

You can also combine do something if X is true OR Y is true (or both
are true!).

```ruby
puts("Input a number!")

number = gets.to_i
if (number == 7) || (number == 13)
  puts("Your number is magic!")
else
  puts("Your number is not magical")
end
```

The following is a common mistake beginners make:

```ruby
# Wrong!
puts("Input a number!")

number = gets.to_i
if number == (7 || 13)
  puts("You input a magic number!")
else
  puts("Your number is not magical")
end
```

If you read `number == (7 || 13)` like English, you might think it
means "Number is equal to 7 or 13". However, Ruby will not interpret
your program this way. Instead, Ruby will compare `number` to the
entire expression inside the parentheses: `(7 || 13)`.

The way the `||` operator works in Ruby is that it returns the left
**operand** (the 7 in `7 || anything`) if it is "truthy" (anything
except `nil` or `false`), otherwise it returns the right operand (e.g,
13 in `false || 13`). Therefore, `(7 || 13) == 7`, since `7` is
truthy.

Therefore, saying `number == (7 || 13)` is equivalent to saying
`number == 7`, which is not what you intended. That's why we write
`(number == 7) || (number == 13)`.

The last important logical connective is **negation**, which we use
the `!` symbol for:

```ruby
# true:
puts(123 == 123)
# false:
puts(!(123 == 123))
```

You can prove to yourself that the following two statements are always
the same for any truth values of `x` and `y`:

    (x && y) == !(!x || !y)

(This is called [DeMorgan's Law][demorgan]).

[demorgan]: http://en.wikipedia.org/wiki/De_Morgan's_laws

## Looping

Oftentimes, you will want to keep running a code block until a test
returns true. For instance:

```ruby
puts("Input a number!")
num = gets.to_i

while num < 100
  puts("That number is too small! Try again!")
  # prompt again, re-assign `num`
  num = gets.to_i
end

puts("You typed " + num.to_s + " which is at least 100!")
```

This will prompt the user for a number. If the user inputs a number
greater than (or equal to) 100, the program will jump past the `while`
loop. If the input number is less than 100, Ruby will execute the body
of the loop. It will then test again whether `num < 100`. If num is
still less than 100, it will execute the body again. Ruby will keep
doing this until the test `num < 100` returns false.

Let's use a loop to write a simple program:

```ruby
i = 0
while i < 3
  puts("Hello world!")
  i = i + 1
end

puts("All done!")
```

This will print "Hello world!" three times. After setting `i` to zero,
Ruby will test if `i < 3`. Ruby will print "Hello world!", then set
`i` to one. Ruby will run the test `i < 3`; this is still true. Ruby
prints "Hello world!" again and increments `i` once more to two. The
test still passes and prints "Hello world!" once more. `i` is
incremented to three; finally the test fails. The body is not executed
again; instead, we print "All done!".

Note that this is a very common pattern to do something a given number
of times.

## Infinite Loops

What if your program never leaves a loop? For instance, consider this
program:

```ruby
while 1 == 1
  puts("We're trapped in a loop!")
end
```

If you run this program, it will endlessly print "We're trapped in a
loop!". Your program will never exit. This is called an **infinite
loop**. Incidentally, Apple's headquarters is at 1 Infinite Loop in
Cupertino.

At any time while your program is running, you can hold the Ctrl key
and press C to stop it. Ruby will print a somewhat nasty error, but
your program will stop. That's the best way to stop the program if you
think it has entered an infinite loop.

## Arrays

We've talked about integers and strings. We need to talk about one
last Ruby data structure: arrays.

Arrays store sequences of objects, separated by commas. For instance:

```ruby
cool_things = ["Racecars", "Lasers", "Aeroplanes"]
four_primes = [2, 3, 5, 7]
an_empty_array = []
```

Arrays wouldn't be very useful if we couldn't get things out of
them. To do this, we can lookup an object in an array by using an
**index**, which is the position in the array we want to lookup.

```ruby
cool_things = ["Racecars", "Lasers", "Aeroplanes"]
puts(cool_things[0])
puts(cool_things[1])
puts(cool_things[2])

# Output
#   Racecars
#   Lasers
#   Aeroplanes
```

In Ruby, and almost all other programming languages, **array indices
always start at zero**. This often strikes new programmers as odd, but
after programming for a while it becomes natural.

In the first line, we lookup the item in the "zeroth" position. This
is the first item in the array: `"Racecars"`. We then look up the item
at position one, which is the second item: `"Lasers"`.

In this example, we printed all three items of `cool_things`. However,
if `cool_things` contained many items, it would be boring to keep
repeating yourself by writing `puts cool_things[...]`. Instead, we can
use the array's `length` method, which is the number of items in the
array.

For example:

```ruby
# You can write an array across many lines like this.
presidents = [
  "George Washington",
  "John Adams",
  "Thomas Jefferson",
  "James Madison",
  "James Monroe",
  "John Quincy Adams"
]

# Prints 6, the number of items in the array
puts(presidents.length)

# Print each one of the presidents in the array.
idx = 0
while idx < presidents.length
  puts(presidents[idx])
  idx = idx + 1
end

puts("PRESIDENTS LOOP COMPLETED!")
```

Look at the loop. It starts `idx` at zero. Since this is less than
`presidents.length` (which is 6), we enter the loop. We print
`presidents[0]`, which is the first president. We then add one to
`idx` and test again whether `idx < presidents.length`; since `1 < 6`,
we execute the loop body again. After printing `presidents[1]`, we
increment `idx` yet again. The loop continues.

When does the loop stop? The last iteration happens after `idx` has
been set to 5; this is still less than `presidents.length`. We print
`presidents[5]`; this is the last president in the array. `idx` is
then incremented one last time to six.

We come back around to to the test: finally, `idx ==
presidents.length`, so it is false that `idx < presidents.length`.
Since the loop condition is no longer true, we stop executing the loop
body. We are done. We can move on to print "PRESIDENTS LOOP
COMPLETED".

This is a very common pattern to iterate through each of the items in
an array and do something with each of them.

## Continue!

You're ready for the [third chapter][intro-to-programming-3] of
Introduction to Programming!

[intro-to-programming-3]: ./introduction-to-programming-3.md
