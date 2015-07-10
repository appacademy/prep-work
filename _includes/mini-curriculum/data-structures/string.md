# Strings

## Goals

* Familiarize yourself with the selected, important methods here.
* Know how to use string interpolation and to prefer it to
  concatenation.

## Quotes

Strings are how we represent text in Ruby. We need to protect the text
from the Ruby interpreter so it doesn't think our text is actually
code:

```ruby
> these are some words
NameError: undefined local variable or method `words' for main:Object
        from (irb):6
        from /Users/ruggeri/.rvm/rubies/ruby-1.9.3-p194/bin/irb:16:in `<main>'
```

Uh oh.

```ruby
> "these are some words"
 => "these are some words"
```

Better. We protect text with quotes. You may use either single or
double quotes:

```ruby
'letters' == "letters" # => true
```

When to use which? If your text includes a quotation mark, you may
want to use the opposite form of quotes:

```ruby
'"Yesterday" has been covered >2,200 times'
"I didn't know that!"
```

## Multiline and Complex Quotes

One of the issues with quotes (both of the single and double variety) is that
they can make for some unwieldy code for other programmers to read and maintain.

Two problems usually come hand in hand for complex blocks of text:
* They may be large, spanning multiple lines
* They may contain specific spacing, inner quotes, and escape characters

```ruby
stomach_contents = "Bacon 'ipsum dolor' sit amet venison\n fatback pig, prosciutto/pork belly jowl.\n
Beef kielbasa leberkas, shank t-bone doner strip "steak" pork loin. Doner hamburger"
```

Yikes! The example above won't compute properly.

We've placed double quotes around steak and double quotes around the entire string.
Ruby inteprets this as two strings separated by an undefined variable, steak.

Let's say we try single quotes to get the "steak" back in there.

```ruby
stomach_contents = 'Bacon 'ipsum dolor' sit amet venison\n fatback pig, prosciutto pork belly jowl.\n
Beef kielbasa leberkas, shank t-bone doner strip "steak" pork loin. Doner hamburger'
```

Now we're getting bit by 'ipsum dolor'.
Notice also, that, having enclosed the string in single quotes, we can no longer access escape characters.
The "\n" will be interpreted as just that, and not a newline as we intend.

These are common problems with complex strings! Not to fret; there are several solutions.

One classic way to handle ` " ` and ` ' ` and ` \ ` within strings is to make a double quoted string and use ` \ ` as an escape character.  Ex: ` "\"Pigs\" is double quoted, and this is a backslash \\" ` will print: "Pigs" is double quoted, and this is a backslash \

## Interpolation

It is very common to build up strings from other strings.

```ruby
worst_day = "Monday"
"#{worst_day}s are the hardest."
# => "Mondays are the hardest."
```

This technique is called *string interpolation*. Inside the `#{}`, you place
ruby code; the code is executed, and the return value is inserted
inside the string.

The code inside the `#{}` should be very short; just one variable plus
maybe a single method call; that keeps things easy to read and
understand. Otherwise, first save the result in a temporary variable,
then interpolate that:

```ruby
MURDER = "redrum".reverse.upcase
"#{MURDER}! #{MURDER}!"
```

String interpolation can only be done with double quotes (""), and
doesn't work with single quotes (''). For this reason, as well as
because single quotes don't support as many
[escape sequences](http://en.wikibooks.org/wiki/Ruby_Programming/Strings#Escape_sequences),
double quotes are the preferred default.

## Concatenating and appending to strings

Interpolation is usually the idiomatic, clean way to build up
strings. Sometimes you'll want more power. Strings have methods that
correspond to array's `<<` and `+` methods: For example:

```ruby
likes = "race cars, lasers, aeroplanes"
dislikes = "harmonicas"

"I like " + likes + ". I don't like " + dislikes + "."
# => "I like race cars, lasers, aeroplanes. I don't like harmonicas."
```

You'd probably prefer string interpolation here, but concatenation is
an option. And not true: harmonicas are cool.

As with arrays, it's common to want to grow strings by appending to
them. You could do this like so:

```ruby
count_in = ""
count_in = count_in + "One, "
count_in = count_in + "two, "
# ...
```

It is preferred to use the shovel (`<<`) operator for this; you'll
look cooler:

```ruby
count_in = ""
count_in << "One, "
count_in << "two, "
# ...
```

## Accessing a substring

You can access substrings of a string much like you can access
subarrays of an array.

```ruby
"this is my sentence"[5..6]
# => "is"
```

Here five is the starting position of the substring, and two is the
substring's length. As with arrays, you may also pass a range.

## Length

To count the number of characters in a string, use the `length`
method:

```ruby
"words words words".length
# => 17
```

## Split a string into parts

It is common to want to split a string into an array of parts. For
instance:

```ruby
ice_creams = "Bi-Rite, Humphrey Slocum, Mitchell's"
ice_creams.split(", ")
#=> ["Bi-Rite", "Humphrey Slocum", "Mitchell's"]

[1] pry(main)> motto = "We all scream for ice cream!"
=> "We all scream for ice cream!"
[2] pry(main)> motto.split(" ")
=> ["We", "all", "scream", "for", "ice", "cream!"]
```

## Nil converts to empty string

```ruby
nil.to_s
=> ""
```


## Other Killer `String` Methods

Read up on 'em all:

* [`#chomp`][chomp-doc]/[`#strip`][strip-doc]
* [`#gsub`][gsub-doc]
* [`#downcase`][downcase-doc]/[`#upcase`][upcase-doc]
* [`#to_i`][to_i-doc]
* [`#to_sym`][to_sym-doc]
* [`#*`][times-doc]

[chomp-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-chomp
[strip-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-strip
[gsub-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-gsub
[downcase-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-downcase
[upcase-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-upcase
[to_i-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-to_i
[to_sym-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-to_sym
[times-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-2A

## Exercises

Estimated time: 1hr

### Your own `to_s` method

In this exercise, I'd like you to write a method `num_to_s(num,
base)`, which will convert a number to a string in a different
base. For instance, `num_to_s(123, 10) == "123"` and `num_to_s(4, 2)
== 100`. It should work for bases up to 16 (hexadecimal).

You can also think of writing numbers in bases like this.
    123 in base 10 = 1*10^2 + 2*10^1 + 3*10^0

    8 in base 2 = 1000 = 2^3*1 + 2^2*0 + 2^1*0 + 2^0*0

    6 in base 2 = 110 = 2^2*1 + 2^1*1 + 2^0*0

    10 in base 3 = 101 = 1*3^2 + 0*3^1 + 1*3^0

You should not call the built in `to_s` yourself. To get around this
restriction you might either:

* Have a giant `case`/`when` switch (ugly; no!)
* Create a `Hash` where the keys are digit numbers and the values are
  the digit strings (for bases > 10 this will involve some characters;
  hex digits go up to `'f'`).

You will want to use the `%`, or modulus function; this finds the
remainder when you divide by a number:

    (123 / 10**0) % 10 == 3 # ones place
    (123 / 10**1) % 10 == 2 # tens place
    (123 / 10**2) % 10 == 1 # hundreds place

Notice that `% 10` gives you the ones place, in decimal. Why? Then you
can *shift* the ones place off by dividing by 10; this rounds down,
leaving you with everything except the ones.

The same logic applies for binary (base 2); but instead of the base
being ten, you use two instead. Then you find the digits in the ones
place, twos place, eights place, etc.

### Caesar cipher

* Implement a [Caesar cipher](http://en.wikipedia.org/wiki/Caesar_cipher).
  Example: `caesar("hello", 3) # => "khoor"`
  * Assume the text is all lower case letters.
  * You'll probably want to map letters to numbers (so you can shift
    them). You can do this mapping yourself, but you may also want to
    use the [ASCII codes][wiki-ascii], which are accessible through
    `String#each_byte`.
    * You will probably also want to use `String#ord` and
      `Fixnum#chr`.
    * Important point: ASCII codes are all consecutive!
    * Lastly, be careful of the letters at the end of the alphabet, like
      `"z"`!

## Resources
http://www.ruby-doc.org/core-1.9.3/String.html

[wiki-ascii]: http://en.wikipedia.org/wiki/Ascii
