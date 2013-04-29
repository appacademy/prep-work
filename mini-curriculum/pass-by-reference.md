# Pass by reference

The Ruby language is what is called a *pass by reference*
language. This means that variables hold *references* to objects, but
let me show you what that means.

    my_object = Object.new
    # my_object now refers to a new instance of Object
    my_object = Object.new
    # a new Object instance is created, and the my_object variable is
    # set so that it now refers to this object, rather than the old
    # object
    
    # call `my_method` on the object that `my_object` refers to
    my_object.my_method

One point is that `=` does not mutate or modify an object; it merely
reassigns the variable so that it now refers to a new object.

Here is another example of pass by reference:

```ruby
def add_to_array(array, item)
  array << item
end

my_array = []
add_to_array(my_array, "an item!")
p my_array
```

This code will modify the array referred to by `my_array`. When we
call `add_to_array`, we're passing it a reference to the same object
referred to by `my_array`, as well as a reference to the literal
string `"an item!"`. So inside `add_to_array`, the variable `array`
refers to the same object that `my_array` refers to outside the
method. So modifications to the array inside the method will be
visible outside.

## The `[]=` and accessor methods

We've said that `=` never modifies an object, and merely reassigns a
variable to refer to a new object. But then how do I explain this:

```ruby
my_hash = {}
# add a key & value to the hash
my_hash[:key] = :value
```

How does this work? Notice that we aren't just assigning to a
variable; we're actually taking `my_hash` indexing by `:key`, and then
assigning. This actually calls a ruby method, called `[]=` on the
object. Here's how it might be defined:

```ruby
class Hash
  def []=(key, val)
    # code to set key so that it maps to value
  end
end
```

In fact, we can even write this with the usual method call notation:

```ruby
my_hash.[]=(:key, :value)
```

Other writer methods work similarly:

```ruby
class Cat
  attr_accessor :name
end

my_cat = Cat.new
my_cat.name = "Breakfast" # == my_cat.name=("Breakfast")
```

Conveniences like this (the ability to write `hash[:key] = :value`
instead of `hash.[]=(:key, :value)`) are called *syntactic
sugar*. They don't change the fundamental way the language works; they
are merely shortcuts to make things a little easier on us.

## `+=` and `!=`

One last bit of syntactic sugar is to discuss how Ruby interprets `+=`
and `!=`. This is done quite simply

```ruby
x += y # => x = x + y, will work as long as `#+` is defined
x != y # => !(x == y), will use the `#==` method
```

So while `[]=` was a method, `+=` and `!=` are pure syntactic
sugar. Ruby will translate them into code that calls `+` and `==`
respectively.

## Exercises
Time estimate: 10 min

* Add two of your own methods to the String class, shout and shout!
each should take a string, and make it all caps, but how they return should be different... make sure one method is safe and the other is "dangerous!" 
