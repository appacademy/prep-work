# Objects and Classes

## Goals

* Know when to stop using a `Hash` and when to switch to a class.
  * Hint: it's when you want methods.
* Know the difference between a class and an instance.
* Know how to use `::new` to create new instances.
* Know when the `initialize` method is called.
  * Know that the instance should be fully setup by the end of
    `initialize`.
* Know how we store data in an object.
  * Know when we can/can't we access instance variables directly.
  * Know how to automatically create getters/setters.

*I feel that I would have benifited from more explanation of OO concepts, like patterns*

*Didn't go over static variables*

## Packaging data in Hashes

It's common to have sets of related data. For instance, a cat has a
name, age, and home city. We could store these three values in three
different variables:

```ruby
cat_name = "Breakfast"
cat_age = 8
cat_home_city = "San Francisco"
```

What if we want to work with two cats? Clearly it would get messy to
have six variables: `cat1_name`, `cat2_name`, `cat1_age`, ...

One solution is to use aligned arrays:

```ruby
cat_names = ["Breakfast", "Earl"]
cat_ages = [8, 2]
cat_home_cities = ["San Francisco", "San Francisco"]
```

Here all the values at position 0 correspond to one cat, all the
values at position 1 correspond to the second cat.

This is a tedious and unpleasant solution; we have to be careful that
we don't mix up the different positions in the array. And what if we
want to pass just one cat to a method? We have to pull all the data
for one cat out of the three arrays, then pass it to the method in
three variables.

*Avoid aligned arrays*; you will rarely want to do this. Instead,
collect data in hashes:

```ruby
cat = {
  :name => "Breakfast",
  :age => 8,
  :home_city => "San Francisco"
}
```

All the related values for a single cat are stored in one object,
which is itself saved to a single variable. One hash represents one
cat. You can easily pass around the hashes.

When you have multiple objects -- say multiple cats -- store them in
an array:

```ruby
cats = [{
  :name => "Breakfast",
  :age => 8,
  :home_city => "San Francisco"
}, {
  :name => "Earl",
  :age => 2,
  :home_city => "San Francisco"
}]
```

Now each object in the array is a hash representing a cat.

Protip: don't proliferate variables. Having more variables means more
things to keep track of and in sync: more possibility for
errors. Example: in the aligned array example, we had three arrays
stored in three variables. To delete a cat we need to remember to
delete the field from each array. And if we forget to do so, the
arrays will become misaligned.

With the one array, we just delete the one hash from the array.

*Use a hash to collect variables that go together.*

## Use classes to add methods

As we've seen, we can use a Hash to represent data. To actually do
things with that data, we need a method:

```ruby
def age_one_year(cat)
  cat[:age] += 1
end
```

This will work, at least until we have two things that can age:

```ruby
def age_one_year(house)
  house[:age] += 1
  house[:value] = 1.07 * house[:value] # house appreciates in value
end
```

Uh-oh, two different types of things can `age_one_year`; we want two
different methods, but they'd have the same name. We could solve this
by creating two different methods:

```ruby
def age_cat_one_year(cat)
  #...
end
def age_house_one_year(house)
  #...
end
```

Ugh; too verbose. Instead, we can define a *class*, which is a way to
represent both data, and methods to modify that data. In technical
jargon, we would say that classes combine *state* (data, fields) and
*behavior* (methods).

## Our first class

### Class vs Instance

Let's define a class to represent our cat. Ruby predefines many
built-in classes (`String`, `Array`, `Hash`); by defining a class
ourselves, we add a new object type which will represent a
cat. *Instances* (an occurrence of an object) of this `Cat` class
represent individual cats. Two `Cat` instances will share the same set
of attributes (state) and methods; they may contain different
attribute values, however.

```ruby
# Cat is our class; the type of thing we are creating
# cat1 holds an instance of Cat representing a cat named Breakfast
cat1 = Cat.new("Breakfast", 8, "San Francisco")
# cat2 holds another instance of Cat representing a cat named Earl
cat2 = Cat.new("Earl", 2, "San Francisco")
```

Helpful reference: http://www.railstips.org/blog/archives/2009/05/11/class-and-instance-methods-in-ruby/
blog about Class and Instance Methods
### `initialize` and `new`

Here's the start of our cat class:

```ruby
class Cat
  def initialize(name, age, location)
    # save variables...
  end
  
  # more methods here...
end
```

To begin defining the class `Cat`, we start with the keyword class and
then the class name. Note that class names are always capitalized and
CamelCase.

Between the class name and the `end`, all methods defined in this
block of code will be `Cat` methods.

The `initialize` method is special. It is called when an
object is first created. To create a `Cat` object, we write:

```ruby
Cat.new("Breakfast", 8, "San Francisco")
```

Every class has a `new` *class method* (a method called on a class,
instead of an object); the `new` method creates a new object and then
calls the `initialize` method, passing the arguments given to `new` on
to `initialize`.

The `initialize` method is responsible for setting up the object. For
`Cat`, we store the vital cat data. The `initialize` method should
take enough arguments so that it can fully setup the initial state of
the `Cat` so that the `Cat` object we get back is fully functional and
ready-to-go. Don't write code like this:

```ruby
# ugly; too many lines; have to write 3 lines every time we want
# to create a new cat; what if I forget some fields?
cat1 = Cat.new
cat1.name = "Breakfast"
cat1.age = 8
cat1.home_city = "San Francisco"
```

In short, after you call `Cat.new`, your `Cat` should be fully setup
and ready to go.

### `initialize` != `run`

Your `initialize` method should not do too much; it should merely set
up the object so that it is ready to be used.

In particular, students sometimes have their `initialize` method run
an interactive program. For example, their `Game#initialize` method
may not only initialize the game state, it may also start actually
playing the game.

That is too much to do inside the `initialize` method, and sort of
abuses it. You may want to be able to create your `Game` object and
test its initial configuration without running it yet. Instead, put
logic like this in a method called `run` (or something similar).

### Instance Methods

Instance methods define the behavior to be exhibited by instances of
the associated class. A class defines the behavior of the instance
methods, which is common to all instances of the class.

```ruby
class Cat
  # ...
  
  def speak
    puts "Meow!"
  end
end

cat1 = Cat.new("Breakfast", 8, "San Francisco")
cat2 = Cat.new("Earl", 2, "San Francisco")
cat1.speak # Breakfast speaks
cat2.speak # Earl speaks
```

Notice that to call a method, we first give the instance, then a '.',
then the name of the method.

An instance method can interact with the instance's state, which means
that calling the same method on different instances can end up doing
different things. To see how this works, we're going to need to learn
about storing object state in instance variables first.

### Instance variables

Object state is stored in *instance variables*. Instance variable
names are prefixed with an at-symbol ('@'). Each object instance has
its own separate copies of the instance variables. The variables are
stored for the life of the object. Just like we store information in a
Hash under a key, we can set and look up data with an instance variable
name.

```ruby
class Cat
  def initialize(name, age, location)
    # save the passed in values to instance variables so that we
    # can use them later.
    @name = name
    @age = age
    @location = location
  end

  # ...
end
```

Instance variables are only directly accessible from inside the
object. This protects them from being exposed to the outside world. If
we do want to share them with other objects, we need to define
*setter* and *getter* methods:

```ruby
class Cat
  # ...

  # a *getter* method that pulls out the cat's name stored in the
  # @name instance variable. `name` is the method; `@name` is the
  # instance variable
  def name
    @name
  end
  
  # a *setter* method; method names that end with an '=' can be
  # used like this: `cat.name = "Fluffy II"`
  def name=(name)
    @name = name
  end
end
```

These simple methods manipulate the instance variables. Note the
difference between `@name` and `name`: the first directly accesses the
instance variable, while the second calls a method that will then
access that variable for us. Different ways to accomplish the same
thing; but only the `name` method can be used outside the class.

Because setter and getter methods are so common and tedious, Ruby
gives us an easy way to define these:

```ruby
class Cat
  # attr_accessor is a class method that adds getters and setters
  # for the age and location variables. See more here:
  #    http://stackoverflow.com/questions/5046831/why-use-rubys-attr-accessor-attr-reader-and-attr-writer
  attr_accessor :age, :location

  # attr_reader adds just a getter; looks like a cat shouldn't be
  # renamed
  attr_reader :name

  def initialize(name, age, location)
    # ...
  end
  
  # ...
end
```

Beware a common mistake:

```ruby
class Cat
  attr_accessor :age, :location
  
  def age_on_year
    # works
    @age = age + 1
    # won't change age
    age = age + 1
    # works again
    self.age = age + 1
  end
```

Each example first calls the `age` getter method and adds one. The
first then sets the instance variable `@age` to this new value. The
third calls the `age=` setter method, passing it the new age; the
method then sets the instance variable for us.

The second doesn't work. It creates a new *local* variable named
`age`, and assigns it the new value. It doesn't modify the instance
variable at all.

In the second example, Ruby assumes that you want to create a variable
named `age` when you use `=`; that is its default assumption. Only if
you say `self.age` does it realize that you really want to call a
method. So beware of this common mistake.

You can also create classes from `struct`, used for quickly
building out classes that store variables and contain reader 
and writer methods.

```
Course = struct.new(:name, :department, :period)
algorithms = Course.new(“Algorithms 101”, Programming , 2)
```

## Class and Instance methods

We've mostly talked about instance methods; instance methods are
defined at the class level, but they are called on an instance of a
class. Depending on the instance's state (its instance variables), the
same instance method may do different things when called on different
instances.

Class methods are not called on instances of the class; they are
called on the class itself. The most prominent example we have seen is
the `new` method:

```ruby
cat = Cat.new # call Cat's class method `new`
cat.speak # call Cat's instance method `speak` on cat
```

Since class methods are not called on an object, they are not specific
to any one object. For that reason, they cannot access instance
variables; there is no object to get the instance variables from.

A common use of class methods is to create new objects (this is what
`new` does); methods that create new objects are called *factory
methods*. Here's an example:

```ruby
class Asteroid
  # initialize a new asteroid
  def initialize(x_coord, y_coord, velocity)
    # ...
  end
  
  # helper class method; doesn't need to be called on an Asteroid
  # object
  def self.random_velocity(max_speed)
    speed = max_speed * rand()
    x_dir, y_dir = rand() * [1, -1].sample, rand() * [1, -1].sample

    [x_dir * Math.sqrt(speed), y_dir * Math.sqrt(speed)]
  end
  
  # factory method
  # create and return an asteroid with random location and direction
  def self.randomAsteroid(max_x, max_y, max_speed)
    # using unnecessary `return` for emphasis
    return Asteroid.new(
      max_x * rand(),
      max_y * rand(),
      random_velocity(max_speed) # implicit `self` refers to the Asteroid class here
    )
  end
  
  def crashIntoPlanet(planet)
    # should have hired Bruce Willis
  end
end
```

In this example, `Asteroid::randomAsteroid` is an example of a factory
method. It is a class method that creates an `Asteroid`. Note that it
is not called on an existing `Asteroid` instance. That makes sense
since it's purpose is to *construct* a new `Asteroid`; it is not an
*action* of an asteroid (like crashing into a planet is an action of
an asteroid).

The `Asteroid::randomVelocity` method is not a factory method (at
least not an `Asteroid` factory), but it is a class method.

When we want to be clear whether a method `crashIntoPlanet` or
`randomAsteroid` is an instance or class method of `Asteroid`, we
write `Asteroid#crashIntoPlanet` and `Asteroid::randomAsteroid`
respectively.

## self

Methods may call other methods:

```ruby
class Cat
  def meow
    puts "Meow"
  end
  
  def hiss
    puts "Hiss"
  end
  
  def throw_fit
    # meow and hiss a lot
    self.meow
    self.hiss
    self.meow
  end
end
```

Notice that `throw_fit` calls `self.meow` and `self.hiss`. Here,
`self` is a special variable that refers to the object the method is
called on. Using the special variable `self`, we can call methods with
the usual dot notation.

Ruby lets the user drop (or *elide*) the `self.` part when calling a
method. By default, the method will be called on `self`:

```ruby
def throw_fit
  # meow and hiss a lot
  meow
  hiss
  meow
end
```

This is the preferred way to do things in Ruby. It can be confusing
because it is not always clear that we want to call a method (instead
of using a variable), but the advantage is concision.

## Defining class methods

Let's see how to define a class method. There are in fact a few ways,
but this is the most commonly used:

```ruby
class Dog
  def self.dog_years_to_human_years(age)
    age / 7.0
  end
end
```

Though this is the preferred way, you may also see:

```ruby
class Dog
  class << self
    def dog_years_to_human_years(age)
      age / 7.0
    end

    def human_years_to_dog_years(age)
      age * 7.0
    end
  end
end
```

You may see this particularly when defining multiple class methods
together.

## Calling class methods from class methods

We've seen that we can call instance methods from other instance
methods. We can do the same for classes:

```ruby
class Dog
  def self.dog_years_to_human_years(age)
    age / 7.0
  end
  
  def self.human_years_to_dog_years(age)
    age * 7.0
  end
  
  def self.human_to_dog_ratios
    # get the equivalent of one dog or human year in terms of the
    # other
    dog_to_human_ratio = self.dog_years_to_human_years(1)
    human_to_dog_ratio = self.human_years_to_dog_years(1)

    { :dog_ratio => dog_to_human_ratio,
      :human_ratio => human_to_dog_ratio }
  end
end
```

Notice the use of `self`. Because `human_to_dog_ratios` is called on
the `Dog` class, `self` returns the `Dog` class itself, the methods
`dog_years_to_human_years` and `human_years_to_dog_years` are then
called on the `Dog` class.

`self` always returns the object that the method is called on. But
isn't `Dog` a class and not an object? It's both! Everything in Ruby
is an object, even classes. Just like `Dog` objects are instances of
the `Dog` class, the `Dog` class is an instance of Ruby's `Class`
class.

For clarity I've used `self` explicitly within `human_to_dog_ratios`;
as mentioned before, you would normally omit this.

As mentioned, we can get a class object by using the `.class` method:

```ruby
dog = Dog.new("August", 6, "Chicago")
dog.class # => Dog
dog.class.class #=> Class
```

Finally, note that class methods are just a special kind of instance
method:

```ruby
dog.bark # => calls `bark` method on a Dog instance
Dog.new # => calls `new` method on a Class instance: Dog
```

## Exercises

Estimated time: 2.5hrs

### Students and Courses
Write a set of classes to model Students and Courses.

* `Student#initialize` should take a first and last name.
* `Student.name` should return the concatenation of the student's
  first and last name.
* `Student#courses` should return a list of the `Course`es in which
  the student is enrolled.
* `Student#enroll` should take a `Course` object, add it to the
   student's list of courses, and update the `Course`'s list of
   enrolled students.
* `Student#course_load` should return a hash of departments to # of
  credits the student is taking in that department
* `Course#initialize` should take the course name, department, and
  number of credits.
* `Course#students` should return a list of the enrolled students
* `Course#add_student` should add a student to the class
  * It should protect against enrolling twice

And some extras:
* Each course should also take a set of days of the week (`:mon`,
  `:tue`, ...), plus a time block (assume each day is broken into 8
  consecutive time blocks). So a course could meet
  `[:mon, :wed, :fri]` during block #1.
* Write a class method `Course::conflicts?` which takes two `Course`s
  and returns true if they conflict.
* Don't let a `Student` enroll in two classes that meet at the same time.

### Tic-Tac-Toe
Let's write a Tic-Tac-Toe game!

* The game should run in a master loop, called a *run loop*.
* Each time around it should prompt both players for their move.
* When someone wins, it should exit the loop.
  * When checking for wins, you should be able to save some lines by
    looping through the rows, columns, and diagonals.
* Your tic tac toe game class should have a `#play` method that
  contains the loop, only returning when the game has completed.
* You should have a class that represents a human player
  (`HumanPlayer`), and another class for a computer player
  (`ComputerPlayer`).
* You should be able to select 2, 1, or no human players.
* Keep the computer AI simple: make a winning move if available; else
  move randomly.
