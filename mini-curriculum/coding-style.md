# Coding style

## Goals

* Always follow these most important rules:
  * Indent your code.
  * Limit lines to 80 chars.
  * Avoid long methods and nesting more than two levels deep.
  * Don't over-comment.
* Use our Textmate config!
    * https://github.com/appacademy/dotfiles/blob/master/Global.tmProperties

## Style matters

People have been writing code for a while, and there is an established
way of doing things. You are new, so you're just learning these
conventions. They may seem arbitrary and silly; some of them
are. Others really do represent common sense.

It is very important to learn and follow style rules. If you write
stylish code, it will make you look more professional and capable. If
not, you'll look inexperienced.

Luckily it's easy to follow the rules; just make sure you start doing
it now so that you start building the habit of stylish coding.

I list the most important rules here, in roughly declining order of
importance. I also link a more comprehensive code style guide at the
end. Long term, the best way to learn good style is to read a lot of
code, and emulate your predecessors. Make your code look like theirs.

## Indentation

Many new programmers do not indent their code, because they haven't
written enough code to understand that it really does help
interpreting and understanding the code. It is a cardinal sin not to
indent your code. Unindented code looks really, really bad to an
experienced dev.

```ruby
class CrazyClass
  # indent classes
  def my_method
    # indent methods
    i = 0
    while i < 10
      # indent loops
      puts "Hello!"
    end
  
    # count in
    4.times do |n|
      # indent blocks
      puts "#{n}!"
      
      # see how the ends always align with the start of the start
      # of the indented section?
    end
  end
end
```

Indent with *two spaces*, not with tab
stops. [Set Textmate to do this by default][textmate-prefs], so
that the tab button inserts two spaces.

## Keep Lines Short

Keep your lines <80 characters long. There are historical reasons to
do this; shorter lines are also (said to be) easier to read. Long
lines make you look like a yahoo or, worse, a Java developer (I was a
Java dev once).

```ruby
class CrazyClass
  def crazy_method
    i = 0
    while i < 100
      "this is my long string".a_long_method_name(a_few_arguments, and_then, it_gets_too, long).should_have_split(this_up, a_while, ago)
    end
  end
end
```

Set Textmate to show a line (called a *rule*) at
[80 columns][textmate-prefs].

[textmate-prefs]: https://github.com/appacademy/dotfiles/blob/master/Global.tmProperties

### No trailing whitespace

This one's minor, but super easy to avoid.

Trailing whitespace (extra spaces at the end of a line) screws up git
diffs (we'll learn about those later) and looks unprofessional.
Luckily, there's an [easy fix][easy-fix] for Textmate.

[easy-fix]: https://github.com/vigetlabs/whitespace-tmbundle

## Avoid very long methods, deep nesting

We'll talk about it more in another chapter, but long methods are
bad. If a method is >8 lines long, you should consider whether it
might be broken into smaller methods. If your method is >20 lines
long, it is getting pretty long. >40 lines and it's just too damn
long, no ifs, ands, or buts.

New developers may write methods that are hundreds of lines. Don't do
that.

Deep nesting often goes hand-in-hand with long methods. Deep nesting
is hard to read:

```ruby
while this
  if that
    array.map do |el|
      if other
        # whoa way too deep
```

Three levels deep is plenty deep already. Break this up into smaller
methods of one or two levels each.

## Avoid over-commenting

**This**: "Good code is like a good joke: it needs no explanation."

Do not comment trivial stuff. This code shouldn't have had any
comments at all:

```ruby
# set i to zero
i = 0

# loop while i < 100
while i < 100
  # print i
  puts i
  
  # increment i
  i += 1
end
```

Don't tell your reader something obvious; assume they can read
code. Use comments when the code is not obvious: when it's tricky. Of
course, avoid tricky code, but if you can't, document it.

## Add line breaks appropriately

Don't double space you're code; the extra space will look silly.

Your methods should be short anyway, but it can be hard to follow many
lines of code with no line breaks. This is a subtle thing, but my
personal style is to add blank lines when I shift from one idea to
another. It works like a paragraph that way. For instance:

```ruby
def my_method
  i = 0
  while i < 100
    square = i * i
    if square % 2
      puts "Even square: #{square}"
    end

    i += 1
  end
end

def another_method
  # etc.
end
```

See how I separate the incrementing from the true "body" of the while
loop? They're separate concerns, so I want to take a breath there.

Likewise, you should always have a
blank line before a method definition.

As ever, your best guide is other people's code. Look especially at my
code, since I'm the one who will bug you about it :-)

## do/end vs {}

When you write blocks, use `{}` notation for one liners, and
`do`/`end` for multi-line blocks.

## Only use return to stop early

You should know that the return value of the a method's last evaluated
line is implicitly returned by the method. In particular, you don't
need to use `return` at the end of every method.

The only time you should use `return` is if you need to stop executing
the method somewhere in the middle of the code.

## Interpolate, don't concatenate

```ruby
"my favorite number is " + favorite_number.to_s + "!" # nooooo
"my favorite number is #{favorite_number.to_s}!" # yessss
```

## References

Batsov's [style guide][bbatsov-style] is a good one to skim. I've
already covered the main rules, but it's probably worth your looking
over briefly. Don't obsess over every rule; they're not set in stone,
and the ones I've listed are the most important.

[bbatsov-style]: https://github.com/bbatsov/ruby-style-guide
