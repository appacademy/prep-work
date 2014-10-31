# Introduction to Programming: I

## Purpose

This minibook is intended to cover everything you need to learn to
prepare for the coding challenge. In it, we'll learn the basics of the
Ruby programming language.

Ruby is a wonderful programming languages with lots of functionality.
We'll focus on the small subset that you need for the coding
challenge.

## What is Programming?

When you write a computer program, you are telling your computer how
to do something. As a programmer, your job is to take a larger task
and break it down into smaller tasks. You then break down these
smaller tasks further until you get to the simplest, most basic tasks
that the computer already understands.

You will use a **programming language** to communicate tasks to your computer.
A computer program is a series of instructions in the
programming language. There are many programming languages: we will
learn **Ruby**. Ruby is an elegant programming language perfect for
students who are beginning to code. It is also powerful and
expressive, which makes it a great choice for advanced programmers.

## Programming Environment Setup

See the [setup instructions][setup].

[setup]: ./setup.md

## Your First Ruby Programs: Numbers and Strings

Let's write our very first Ruby program. In the Nitrous.io text
editor, write the following:

```ruby
puts("Hello world!")

# Output:
#   Hello world!
```

Save your program as `first_program.rb`. In the console, type in `ruby
first_program.rb`. This will run the program you just wrote. Your
program should print "Hello world!".

`puts` is one of the most basic Ruby commands (also called
**methods**). `puts` tells Ruby to print out a **string**. A
**string** is a sequence of characters. Ruby strings have nothing to do
with yarn; it's just a weird name.

To write a string in your Ruby program, wrap it in quotation marks;
without the quotes, Ruby will think that the contents of the string is
Ruby code, get confused, and print an error:

```ruby
# wrong!
puts(Hello world!)

# right!
puts("Hello world!")

# Output:
#   Hello world!
```

`puts` can also print out numbers:

```ruby
puts("The answer to life, the universe, and everything:")
puts(42)

# Output:
#   The answer to life, the universe, and everything:
#   42
```

This should print two lines: the first says "The answer to life, the
universe, and everything" and the second says "42".

In Ruby, we call whole numbers like `42` **integers**. Fractional
numbers (with decimal points) like `3.1415` are called **floats**. In
this book, we'll mostly use integers.

By the way, don't write any commas in integers. For instance:

```ruby
# wrong!
puts(4,000)

# right!
puts(4000)
```

The commas will confuse Ruby.

Ruby provides all the traditional mathematical operations:

```ruby
puts(3 + 4)
puts(7 - 5)
# The asterisk means multiplication
puts(3 * 4)
# The slash means division
puts(8 / 2)

# Output:
#   7
#   2
#   12
#   4
```

Let's highlight one weird thing:

```ruby
puts(9 / 2)

# Output:
#   4
```

When we divide two integers, Ruby does not return a fractional number.
Instead, it rounds down to an integer. Most programming languages work
similarly. There is some sense to it. If a donut costs $2, and you
have $9, how many donuts can you buy? Assuming that the donut shop
won't sell you half a donut, you can buy at most 4 donuts.

In the case where you want the fractional answer, you could write:

```ruby
puts(9.0 / 2)
puts(9 / 2.0)

# Output:
#   4.5
#   4.5
```

If at least one number is a fractional number (that is, a float), then
the answer will be a float. If you have two integers, you can also
write:

```ruby
puts(9.fdiv(2))

# Output:
#   4.5
```

The `fdiv` method will give a fractional answer. For our purposes,
**integer division** will typically be fine.

One last interesting operation is the `%`, or **modulo** operation.
`n % m` returns the remainder when dividing `n` by `m`:

```ruby
# 4 divides 11 two times:
11 / 4 == 2
# The remainder of dividing 11 by 4 is 3:
11 % 4 == 3
```

This is often useful when asking if one number evenly divides a second
number; in that case the remainder is zero:

```ruby
# 4 divides 12 three times:
12 / 4 == 3
# the remainder is zero:
12 % 4 == 0
# therefore 4 divides 12 evenly
```

## Variables

Say that we wanted to print a string three times. We could write a
program like this:

```ruby
puts("Racecars, Lasers, Aeroplanes")
puts("Racecars, Lasers, Aeroplanes")
puts("Racecars, Lasers, Aeroplanes")

# Output:
#   Racecars, Lasers, Aeroplanes
#   Racecars, Lasers, Aeroplanes
#   Racecars, Lasers, Aeroplanes
```

This requires us to repeat the string `"Racecars, Lasers, Aeroplanes"`
each time, which requires extra typing. Instead, let's **store** the
string in a **variable**:

```ruby
cool_things = "Racecars, Lasers, Aeroplanes"
puts(cool_things)
puts(cool_things)
puts(cool_things)

# Output:
#   Racecars, Lasers, Aeroplanes
#   Racecars, Lasers, Aeroplanes
#   Racecars, Lasers, Aeroplanes
```

By writing `cool_things = "Racecars, Lasers, Aeroplanes"`, we are
storing the string for later use. `cool_things` is a **variable**; it
is a name that we can use later. A variable name consists of letters
and numbers; the first character needs to be a (lowercase) letter.
Variables must not contain spaces.

When the name of a variable consists of multiple words, it is Ruby
convention to separate the words with a `_`.

After **assigning** the variable `cool_things`, you can use the name
`cool_things` anywhere thereafter to refer to the string `"Racecars,
Lasers, Aeroplanes"`.

You can **re-assign** a variable so that it refers to a different
value:

```ruby
# Assignment
cool_thing = "Racecars"
puts(cool_thing)
puts(cool_thing)

# Re-assignment
cool_thing = "Lasers"
puts(cool_thing)
puts(cool_thing)

# Output:
#   Racecars
#   Racecars
#   Lasers
#   Lasers
```

Re-assignment is what gives **variables** their names; the value
assigned to the variable can change over time.

## User Input

Right now our programs can't do very much, because they can't get any
input from the user. Let's start to change that using Ruby's `gets`
method.

```ruby
puts("Type in your name!")
name = gets()
puts(name)
puts(name)
puts(name)
```

If you run this program, it will stop and wait for you to type in
input. If you type in `Abraham Lincoln` and press enter, the program
will assign `name` to refer to the string `"Abraham Lincoln"`. It will
then print Abraham Lincoln three times.

User input is what allows programs to do different things. In this
example, the program will print something different if you type in a
different name.

## Methods With No Arguments

We wrote `name = gets()`. This runs the `gets` method, which will wait
for user input and then return it. I've written `gets()` to make it
clearer that we're running a method; this is similar to `puts(name)`,
where the input `name` (called an **argument**) is being **passed
into** the `puts` method as input. The `puts` method will use the
input `name` and print it out.

Methods that take no arguments, like `gets`, don't need to include
parentheses; they're optional. For instance, we can write:

```ruby
puts("Type in your name!")
name = gets
puts(name)
puts(name)
puts(name)
```

This makes it less clear that `gets` is a method being run; it might
look like `name` is being set to whatever is stored in the variable
`gets`. But that's not what is happening; there is no variable named
`gets`, so Ruby looks for a method named `gets`, which it then runs
with no input.

This is common practice in Ruby: not to use `()` when calling a method
with no arguments. Rubyists do this because they think it looks
cleaner.

## Converting Between Strings and Integers

The `gets` method returns a string. What if we want to prompt the user
for an integer?

To convert a string to an integer, we can use the `to_i` method. We
use it like so:

```ruby
seven = "4".to_i + "3".to_i
puts(seven)

# Output:
#   7
```

Let's see what would happen if we did not use `to_i`:

```ruby
not_seven = "4" + "3"
puts(not_seven)

# Output:
#   43
```

The `+` operation, when used with string objects, does not mean
addition. Instead, when you use `+` with strings, Ruby
**concatenates** them:

```ruby
cool_things = "Racecars, " + "Lasers," + " Aeroplanes"
puts(cool_things)
# Output:
#   Racecars, Lasers, Aeroplanes
```

Concatenation means mashing the strings together to form one longer
string. When we say `"4" + "3"`, it takes the two one-character
strings and creates a single two character string `"43"`.

Again, to turn the string `"123"` into the integer `123`, write
`"123".to_i`. So here is how we can prompt for an integer:

```ruby
puts("I will add 5 to your number; type a number!")
input = gets
puts(5 + input.to_i)
```

You can add two integers (`4 + 3` equals `7`) or you can add two
strings (`"4" + "3"` equals `"43"`). You cannot add one integer and
one string together:

```ruby
# Wrong!
"4" + 3

# Wrong!
4 + "3"
```

These don't work because Ruby doesn't understand what you want. Do you
want the integer `7` or the string `"43"`. It's not clear to Ruby. It
will yell at you:

```
test.rb:1:in `+': no implicit conversion of Fixnum into String (TypeError)
        from test.rb:1:in `<main>'
```

Just as you can use the `to_i` method to convert from a string to an
integer, you can use the `to_s` method to convert from an integer to a
string. For instance:

```ruby
one = 1.to_s
three = 3.to_s
puts(one + three + " is an unlucky number!")

# Output:
#   13 is an unlucky number
```

**Notice that throughout we haven't written `1.to_s()` or
`"234".to_i()` with parentheses, because when there are no arguments,
the parentheses aren't necessary.**

## The `chomp` Method

Let's see another user input example:

```ruby
puts("Type in your name!")
name = gets
puts("Hello " + name + "!")
```

If I run this program and type in "Ned", followed by enter, the
program will output:

    Hello Ned
    !

The "!" will be placed on the following line. That's because Ruby
reads the characters "N", "e", "d", and enter. Because it reads the
enter character (technically called the **newline** character),
there's a newline after the "d" but before the "!" in the output.

The `chomp` method is called on a string and removes any newlines at
the end of the string. It is very common to write:

```ruby
puts("Type in your name!")
# Read a line, and strip off the enter character at the end.
name = gets.chomp
puts("Hello " + name + "!")
```

Now if I type "Ned" and press enter, the program will print:

    Hello Ned!

The `chomp` method produces a new string without the newline; it does
not modify or change the original string. The following would not fix
the original problem:

```ruby
puts("Type in your name!")
name = gets

# Creates a new string without the newline, but does not change the
# original string referenced by the variable `name`. In this program,
# the result of name.chomp is not stored or used anywhere, so this
# line is superfluous.
name.chomp

puts("Hello " + name + "!")
```

We could fix this by **reassigning** name:

```ruby
puts("Type in your name!")
name = gets

# Reassign name to refer to the new string returned by `name.chomp`
name = name.chomp

puts("Hello " + name + "!")
```

In the real world, it is often simplest to write `gets.chomp`.

## Continue!

You're ready for the [second chapter][intro-to-programming-2] of
Introduction to Programming!

[intro-to-programming-2]: ./introduction-to-programming-2.md
