# Debugging

Any program of sufficient complexity is unlikely to work the first
time. You will make mistakes. Skilled and unskilled developers write a
similar number of bugs. The difference is that skilled developers are
able to quickly identify and fix bugs.

A rule of thumb is that it takes 10x as long to debug code as
to write it. Master debugging and you master programming.

## Write code that's testable

Let's consider a Ruby script that is supposed to print the first 100
primes:

```ruby
# primes.rb

primes = []

num = 1
while primes.count < 100
  is_prime = true
  (1..num).each do |i|
    if (num % i) == 0
      is_prime = false
      break
    end
  end

  if is_prime
    primes << num
  end
end

puts primes
```

This program doesn't work; it doesn't look like it ever
returns. Where's the bug (or bugs)?

The bugs could be anywhere, but we don't have the ability to isolate
and test individual parts of the code. When we load up this file, it
immediately starts running all the code.

Let's make this more *testable*: let's break the code into small,
bite-sized methods. Small methods are easier to test, because you can
test each part independently.

General hint: when you write a *script*, write all your code inside of
methods. Only a very little bit of code should be written at the top
level to kick things off.

```ruby
# primes.rb

def prime?(num)
  (1..num).each do |i|
    if (num % i) == 0
      return false
    end
  end
end

def primes(num_primes)
  ps = []
  num = 1
  while ps.count < num_primes
    primes << num if prime?(num)
  end
end

if __FILE__ == $PROGRAM_NAME
  puts primes(100)
end
```

This code uses a common trick. We will want to be able to load our
code without running it immediately. In particular, we'd like to
directly call the methods and diagnose whether each is working. But
before we were blocked because the program immediately started
executing the script and entering an infinite loop.

The solution is the trick `if __FILE__ == $PROGRAM_NAME`. This checks
to see if the currently running program (`$PROGRAM_NAME`) is the same
as the current file (primes.rb). If so, then this is being invoked as
a script, so we should kick things off. Otherwise, we're loading it as
part of some other program (like irb or Pry), and we shouldn't do more
than load the method definitions so that someone else may use them.

Great. Now we can test the `prime?` and `primes` pieces
individually. If one works and the other doesn't, we can focus on the
single broken method. Even if both are broken, we can fix `prime?`
first, and then try to debug `primes` knowing that `prime?` at least
works.

Also, because `prime?` and `primes` do one simple thing, we know what
they're *supposed* to do: `prime?(2)` should be true. `prime?(4)`
should be false. `primes(3)` should be `[2, 3, 5]`.

This is better than a huge, black-box method which does a bunch of
complicated stuff where it's hard to even know what the right answer
should be.

### Pay technical debt

If you encounter buggy code that is poorly decomposed into methods,
**fix the design immediately**. You're going to want to fix the design
eventually anyway; refactoring will probably create new bugs to fix,
so you might as well deal with this bug at the same time.

More importantly, good code is the gift that keeps on giving. If this
code is broken today, it's safe to assume that it will bite you in the
ass with another bug a few days from now, too. And every time you come
back to this code, you'll be fighting its poor design as you try to
deal with it. Try to fix it now once and for all.

In the rush to complete projects, bad design is sometimes a compromise
made to finish a project on-time. This is called *technical
debt*. It's okay to take out debt like this, just like it's okay to
take out financial debt. But the more debt you take out, the higher
the payments in the form of your time.

## Don't read the source

We haven't found out what's wrong yet. You might be tempted to first
look carefully at `prime?` and `primes`, try to reason through them,
and spot the bug. You may be able to do this with my simple
example.

**Do not spend more than 1min doing this in real life**. Yes, many
silly bugs can be spotted if you stare at the code, but many other
silly bugs are difficult to spot because our eyes play tricks on
us. You know how you can still read a paragraph with the spaces taken
out? For the same reason, it's hard to spot silly bugs, because you
know what the code is *supposed* to do.

Your bug may not be a simple bug. If it's at all non-trivial, it will
be *very* hard to spot. The best way to find a bug like this is to
take your code step-by-step. We'll see how to do that soon.

Yes, when debugging you should look at the source to familiarize
yourself with the code. The bug may jump out at you. If not, don't
worry. We're about to learn better techniques.

## Pry and debugger

We're going to use two gems. One is called Pry, which is a replacement
for [irb][irb]. You'll have to `gem install pry`. It's not essential for
debugging that you use Pry, but it will make life nicer.

[irb]: http://en.wikipedia.org/wiki/Interactive_Ruby_Shell

We're also going to use debugger (`gem install debugger`). This is a
Ruby 1.9.3 gem, so make sure you have that version. You may also wish
to grab my [.pryrc][pryrc] and [.rdebugrc][rdebugrc] files. Download
them to your home (`~`) directory and rename them with an initial
dot. They should be picked up and used by Pry and the Ruby debugger
automatically.

[pryrc]: https://github.com/ruggeri/dotfiles/blob/master/ruby/pryrc
[rdebugrc]: https://github.com/ruggeri/dotfiles/blob/master/ruby/rdebugrc


## Use the REPL to isolate the problem

Now that we've broken the code up into testable bits, let's actually
test those parts. That lets us quickly isolate the problem to a few
lines.

```ruby
> require './primes'
=> true
> prime?(2)
=> false
```

Awesome. We've already found a *regression*; an input which produces
the wrong output. We also know there is a problem in `prime?`. Even if
`primes` is also buggy, it would have been a real PITA to try to fix
it when the underlying `prime?` method is broken.

Decomposition for the win.

## Use debugger to step through code

Once you've isolated a bug to a small amount of code, the best way to
uncover the problem is to single-step through the code, checking what
the program does along the way. This is what a *debugger* does.

To start, we need to modify our program slightly so that we *drop
into* the debugger when `prime?` is called:

```ruby
require 'debugger'

def prime?(num)
  debugger

  (1..num).each do |i|
    if (num % i) == 0
      return false
    end
  end
end
```

Let's kick the debugger off by calling the method:

```ruby
[1] pry(main)> require './primes'
=> true
[2] pry(main)> prime?(2)
/Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:7
(1..num).each do |i|
(rdb:1) list
[2, 11] in /Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb
   2  require 'debugger'
   3
   4  def prime?(num)
   5    debugger
   6
=> 7    (1..num).each do |i|
   8      if (num % i) == 0
   9        return false
   10      end
   11    end
(rdb:1)
```

`debugger` pauses the execution of the method and drops us into the
*debugger*. The debugger lets us step through our code one line at a
time, testing the result along the way. The debugger prompt looks like
`(rdb:1)`; you can see I gave it the `list` command, which will list
the current code where we are at (my .rdebugrc will autolist lines
after each step). Our position is indicated by the arrow. We're at
line 7; let's proceed step-by-step into the loop body by using the
`next` command.

```ruby
(rdb:1) next
/Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:8
if (num % i) == 0
(rdb:1) list
[3, 12] in /Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb
   3
   4  def prime?(num)
   5    debugger
   6
   7    (1..num).each do |i|
=> 8      if (num % i) == 0
   9        return false
   10      end
   11    end
   12  end
```

You can see how the arrow has advanced. Let's see what happens at this
if statement.

```ruby
(rdb:1) next
/Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:9
return false
(rdb:1) list
[4, 13] in /Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb
   4  def prime?(num)
   5    debugger
   6
   7    (1..num).each do |i|
   8      if (num % i) == 0
=> 9        return false
   10      end
   11    end
   12  end
   13
(rdb:1)
```

Wait; we entered the `if`? How? Let's check the values of `i` and
`num` using the `p` command:

```ruby
(rdb:1) p i
1
(rdb:1) p num
2
```

Hmm... We shouldn't check for divisibility by one. Upon reflection, we
shouldn't start the index at 1 at all; we should start at 2. We can
quit out of the debugger (and irb), then edit the source.

```ruby
def prime?(num)
  debugger # let's leave this in a moment

  (2..num).each do |i|
    if (num % i) == 0
      return false
    end
  end
end
```

Let's restart the REPL and run again:

```ruby
[1] pry(main)> require './primes'
=> true
[2] pry(main)> prime?(2)
/Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:7
(2..num).each do |i|
(rdb:1) c
=> false
```

I used `c` (for `continue`) to tell the debugger to keep running the
code; the code never told us to go back to the debugger, so the
method finished and returned `false`. Looks like we have more work to
do.

Let's use a *breakpoint*:

```ruby
[3] pry(main)> prime?(2)
/Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:7
(2..num).each do |i|
(rdb:1) l
[2, 11] in /Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb
   2  require 'debugger'
   3
   4  def prime?(num)
   5    debugger
   6
=> 7    (2..num).each do |i|
   8      if (num % i) == 0
   9        return false
   10      end
   11    end
(rdb:1) break 9
Breakpoint 1 file /Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb, line 9
(rdb:1) c
Breakpoint 1 at /Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:9
/Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:9
return false
(rdb:1) l
[4, 13] in /Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb
   4  def prime?(num)
   5    debugger
   6
   7    (2..num).each do |i|
   8      if (num % i) == 0
=> 9        return false
   10      end
   11    end
   12  end
   13
```

Note that the `l` command is an alias for the `list` command.

I add a breakpoint to line 9 with the `break` command. This tells the
debugger to make sure to stop when I hit line 9. Since I know 2 is
prime, it should help to put a breakpoint at 9 (where false is
returned), so I can check out what the variables are at this point. I
then tell the program to run freely (`c`, or `continue`), and
eventually we arrive at line 9.

```ruby
(rdb:1) p i
2
(rdb:1) p num
2
```

Groan. We are testing whether `num` is divisible by itslf. That's
because `(2..num)` includes num; we wanted `(2...num)`. Fix and then
reload:

```ruby
[1] pry(main)> require './primes'
=> true
[2] pry(main)> prime?(2)
/Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:7
(2...num).each do |i|
(rdb:1) c
=> 2...2
```

Weird, but better; at least this isn't false. But because we don't
return `true` at the end of `prime?`, the last returned value is
used. Note that `Enumerable#each` returns `self`; in this case the
range itself. Let's finish fixing this method.

```ruby
def prime?(num)
  (2...num).each do |i|
    if (num % i) == 0
      return false
    end
  end

  true
end
```

Does it really work? We ought to check with a few values other than 2:

```ruby
[1] pry(main)> require './primes'
[2] pry(main)> prime?(2)
=> true
[3] pry(main)> prime?(3)
=> true
[4] pry(main)> prime?(10)
=> false
[5] pry(main)> prime?(17)
=> true
```

All looks good. Notice how we can quickly check a number of values in
the REPL.

## Reading stack traces

Now that `prime?` appears to be working, it's time to test
`primes`. We've added a call to `debugger` at the start of
`primes`. Again, we use the REPL:

```ruby
[1] pry(main)> require './primes'
=> true
[2] pry(main)> primes(2)
/Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:17
ps = []
(rdb:1) c
ArgumentError: wrong number of arguments (0 for 1)
        from: /Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:14:in `primes'
        from: /Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:20:in `primes'
        from: (pry):2:in `__pry__'
```

This means the method failed. When an exception is thrown and no code
catches and handles the exception, then the program stops (crashes)
and the exception and plus stack trace are printed.

The first line ("ArgumentError: wrong number of arguments (0 for 1)")
is the exception type (`ArgumentError`) and message. This message says
that we're passing the wrong number of arguments to a method: zero
arguments instead of one argument.

Where did this happen? The following lines, called the *stack trace*
tell us. The top line of the stack trace tells us what method
(`primes`) and line of code (14) was executing when the error
occured. The next line tells us what called `primes`; it looks like
`primes` calls itself, on line 20. The next line starts with '(pry)';
this is pry executing the code we gave us.

It's certainly odd that primes is calling itself. Let's check this
out:

```ruby
[3] pry(main)> primes(2)
/Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:17
ps = []
(rdb:1) l
[12, 21] in /Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb
   12  end
   13
   14  def primes(num_primes)
   15    debugger
   16
=> 17    ps = []
   18    num = 1
   19    while ps.count < num_primes
   20      primes << num if prime?(num)
   21    end
```

Ah. This says that if `prime?(num)`, then `primes << num`. This tries
to call `primes` again, but what we really wanted was to push `num`
into our list, named `ps`. This is confusing because it's not super
clear that `primes` is calling a method (equivalent to `self.primes`).

Fix this and restart `pry`.

```ruby
[2] pry(main)> primes(2)
/Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:17
ps = []
(rdb:1) c
=> nil
```

Oops. A few more simple bugs. You catch them.

## Step vs Next

Here I have line by-line advanced through `primes`:

```ruby
(rdb:1) n
[15, 24] in /Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb
   15    debugger
   16
   17    ps = []
   18    num = 1
   19    while ps.count < num_primes
=> 20      ps << num if prime?(num)
   21    end
   22  end
   23
   24  if __FILE__ == $PROGRAM_NAME
/Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:20
ps << num if prime?(num)
```

I could type `n` to execute this line and advance (back to line 19,
actually). But what if I wanted to "step into" the call to `prime?`?
To do this, I use `s` or `step`:

```ruby
(rdb:1) s
[0, 9] in /Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb
   1  # primes.rb
   2  require 'debugger'
   3
   4  def prime?(num)
=> 5    (2...num).each do |i|
   6      if (num % i) == 0
   7        return false
   8      end
   9    end
/Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:5
(2...num).each do |i|
```

This is handy when you want to go down into methods. If I'm no longer
interested in stepping through all of `prime?`, I can finish it and
move up a level by using `finish`:

```ruby
(rdb:1) finish
[15, 24] in /Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb
   15    debugger
   16
   17    ps = []
   18    num = 1
   19    while ps.count < num_primes
=> 20      ps << num if prime?(num)
   21    end
   22  end
   23
   24  if __FILE__ == $PROGRAM_NAME
/Users/ruggeri/aa/rails-curriculum/ruby/debugging/primes.rb:20
ps << num if prime?(num)
```

## Debugging and Testing

We've gone to a lot of work testing that these methods work as they
should. It would be good if we could record these tests so that they
can be run later, to make sure new bugs have not snuck in. We'll talk
later about RSpec, a way to write tests that can be automatically run
by a system called Guard.

When a bug is discovered, good practice is to write a new test that
verifies we don't make that mistake again.

## Resources
* Pivotal Labs [cheatsheet]
* Comprehensive (very long) [debugger documentation][debugger-documentation]

[cheatsheet]: http://pivotallabs.com/users/chad/blog/articles/366-ruby-debug-in-30-seconds-we-don-t-need-no-stinkin-gui
[debugger-documentation]: http://bashdb.sourceforge.net/ruby-debug.html
