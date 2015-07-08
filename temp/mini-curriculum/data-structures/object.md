# Object

## Goals

* Know that every class in Ruby is a subclass of `Object`, everything
  is an instance of `Object`.
* Know that if you want to be able to compare your classes with `==`,
  you should override the default by writing this method yourself.
* Know what the default `==` implementation does if you do not
  override it.

## We are all `Object`s now

In Ruby, everything is an Object. That means that hashes, strings,
objects from user-defined classes, and even numbers and strings all
have methods. This is different than some other languages like Java or
C++ where ints, floats and strings are special, non-object *primitive*
types.

Everything being an object is part of what makes Ruby so expressive
(though there are performance trade-offs). For instance, we get lots
of powerful methods on the basic types:

```ruby
"to low a case".upcase # => "TO LOW A CASE"
3.times do
  puts "Three times round!" # print this three times
end
(3.3).round # => 3
```

Every class -- whether it's Hash, Array, String, or Int -- inherits
from a single, root class Object. Everything really is an Object.

The methods of the Object class are available on every object, no
matter the class. There are a few very useful methods.

## `inspect` and `to_s`

Every class inherits two methods: `inspect` and `to_s`.

`to_s` converts the value to a string. For instance:

```ruby
3.to_s # => "3"
[1, 2, 3].to_s # => "[1, 2, 3]"
"my_string".to_s # => "my_string" (already a string)
nil.to_s # => "" (nil represented as nothing, or emptiness)
```

`inspect` returns a debugging string that represents the Ruby
object. `inspect` is meant to be used, for instance, in the
interpreter, or to print out debugging information:

```ruby
3.inspect # => "3" (same as to_s)
[1, 2, 3].inspect # => "[1, 2, 3]" (same as to_s)
"my_string".inspect # => '"my_string"' (notice the quotes)
nil.inspect # => "nil"
```

`inspect` returns valid Ruby code.

### `puts` vs `p`

When printing to output using the `Kernel` methods `puts` and `p`, they call
`to_s` and `inspect` on their argument for you. For instance

```ruby
puts "my string!" # prints "my string!"
p "my string!" # prints '"my string!"'
```

In particular

```ruby
puts nil # => prints a blank line
p nil # => prints "nil"
```

`puts` is the method to use when we're printing out the main result of
the program. `p` is the method to use when printing out debugging
information.

### The `Kernel` module

Methods that are defined at the top level scope are methods of the
`Kernel` module. The `Kernel` module is mixed into every class, so
that you may call these "global" methods from any context. If you are
looking for the definition of global methods like `puts` and `gets`,
you'll want to look at the `Kernel` documentation.

Don't worry if this doesn't make sense at this moment; you can write
lots of Ruby code without worrying over every detail of how the Ruby
language is designed.

## nil?

Because `nil` represents nothingness, it is often returned from
methods when there is no answer.

```ruby
[1, 2, 3].index(42) # find the position of 42 in the array
# => nil (nil isn't in the array)
```

Often we want to check whether we got `nil` back

```ruby
puts "Couldn't find answer" if [1, 2, 3].index(42) == nil
# should use include? method, but this is an example
```

Because it is so common to ask whether a value is equal to `nil`,
Object defines a special method, `nil?`:

```ruby
puts "Couldn't find answer" if [1, 2, 3].index(42).nil?
```

This works because `nil` is itself an Object. The return value of
`nil?` as defined in Object is false. `NilClass`, the class that `nil`
is an instance of, is the only class which defines `nil?` to return
true.

## Reflection methods

Objects have many methods to list their methods, check what class they
belong to, find what instance variables they hold. These methods can
be handy, but they're an advanced feature you needn't be too concerned
about right now.

One helpful method, `class` can tell you what kind of object you're
dealing with:

```ruby
"string".class # => String
3.class # => Fixnum
some_mystery_variable.class # will tell me what kind of class this is
```

Another common method to use is `is_a?`, which will tell you if an
object is an instance of a class (or a subclass).

```ruby
"string".is_a?(String) # => true
"string".is_a?(Object) # => true (everything is an object)
```

## Equality methods

Object defines a method `==` that compares two objects and returns
true if they are equal. Two objects are equal if they have the same
value; this works for all built in Ruby classes:

```ruby
2 == 2 # => true
2 == 4 # => false

s1 = "this"
s2 = "this" # different string, same value
s1 == s2 # => true
```

However, by default, an `Object` doesn't know how to compare itself to
other objects. For instance, if you define a new class, `Fraction`:

```ruby
class Fraction
  attr_reader :numerator, :denominator
  def initialize(numerator, denominator)
    @numerator, @denominator = [numerator, denominator]
  end
end

Fraction.new(3, 6) == Fraction.new(1, 2) # => false
```

The proper thing for `Fraction` to do is to know that 3/6 is equal to
1/2. But Ruby doesn't know this without you telling it. Instead, it
will do the only thing it knows how; it will ask whether the two
`Fraction` objects are the same *object*, which is not true: they're
two different objects which represent the same fractional value.

We can rebuild him... we have the technology:

```ruby
class Fraction
  # ...
  def ==(other)
    # first, check if we're comparing two fractions, comparing two
    # different types of objects should return false
    return false unless (other.is_a?(Fraction))
    
    (numerator / denominator) == (other.numerator / other.denominator)
  end
end
```

There are a number of other equality operations, but this is the most
important one. You can read a good
[write-up by Skorks][skorks-on-equality]. Also see [SO][so-equals].

[skorks-on-equality]: http://www.skorks.com/2009/09/ruby-equality-and-object-comparison/
[so-equals]: http://stackoverflow.com/questions/7156955/whats-the-difference-between-equal-eql-and/7157051#7157051

## Resources
* [Ruby-Doc on Object](http://ruby-doc.org/core-1.9.3/Object.html)
