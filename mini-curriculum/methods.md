# Methods (Functions)

## Goals

* Know what [side effects](http://en.wikipedia.org/wiki/Side_effect_(computer_science)) and return values are.
* Know what an implicit return is, and that they are preferred.
* Know some signs of a good method:
  * does one thing
  * short description, good name
  * <10 lines of code

## Side-effects vs return values

In Ruby, **every method has a return value**. Sometimes, the return
value is meaningful, and sometimes it isn't (often the return value is
`nil` in this case). Let's take a look at a few examples to see how
this plays out:

Here's an example of a method that returns the square of a
number:

```ruby
def square(num)
  num * num
end
```

Notice that there we don't say `return num * num` (an *explicit
return*). Ruby has *implicit returns*, that is, **the last evaluated
expression in a method is the return value of that method**. Because
of implicit returns, we only use explicit returns when we want an
early return, such as in the following method:

```ruby
def go_home
  return unless can_go_home? && wants_to_go_home?
  
  pack_bags
  get_tickets
  board_plane
end
```

See [this post][eriwen.com] for a similar example and why you
might want to do this.

[eriwen.com]: http://www.eriwen.com/ruby/more-readable-conditionals/

There are also methods that return nothing; we just use for their
side-effects. When we say side-effect, we mean some sort of
modification to a non-local variable or some sort of observable
interaction with calling methods or the outside world.

A great example of a method that is used for its side effect is
`puts`. Another one is `each`. `each` returns the original array
(which provides no new information and is therefore not terribly
useful) and thus is used exclusively for its side-effects.

## Good methods are short, simple and coherent

Your methods should be as simple as possible. In particular, they
should do one thing; you should be able to explain what it does in a single
sentence. You should be able to give it a straightforward, descriptive
name. Another sign of a good method is that it is <10 lines. The
primary way to achieve this is to break code up into several shorter
methods.

In computer science, there is no greater quality than code that is
easy to understand. Make a start by keeping your methods short and
sweet.

## Exercises

Estimated time: 1hr

* Implement a Rock, Paper, Scissors game. The method `rps` should take
  a string (either "Rock", "Paper" or "Scissors") as a parameter and
  return the computer's choice, and the outcome of the match. Example:

```ruby
rps("Rock") # => "Paper, Lose"
rps("Scissors") # => "Scissors, Draw"
rps("Scissors") # => "Paper, Win"
```

* Implement a Swingers game. The method `swingers` should take an
  array of couple arrays and return the same type of data structure,
  with the couples mixed up. Assume that the first item in the couple
  array is a man, and the second item is a woman. Don't pair a person
  with someone of their own gender (sorry to ruin your fun). An
  example run of the program:

```ruby
swingers([
  ["Clyde", "Bonnie"],
  ["Paris", "Helen"],
  ["Romeo", "Juliet"]
])
```

* Bonus problem: make a version of the swingers game that *guarantees*
  that all the couples end up with a different partner!

## Resources
* [Wikipedia: Single Responsibility Principle](http://en.wikipedia.org/wiki/Single_responsibility_principle)
* [Wikipedia: Side effect][wiki-side-effects]
* [StackExchange answer on side effecs](http://programmers.stackexchange.com/questions/40297/what-is-a-side-effect#answer-40314)
* [Curly's Law](http://www.codinghorror.com/blog/2007/03/curlys-law-do-one-thing.html)

[wiki-side-effects]: http://en.wikipedia.org/wiki/Side_effect_(computer_science)

## Credit
Some exercises adapted from [RubySource](http://rubysource.com/ruby-golf/)
