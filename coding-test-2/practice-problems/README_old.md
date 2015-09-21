If you haven't already done so, follow [these instructions][setup] to setup a
web based ruby development environment. Once installed you will be able to run
all of the practice problems from there.

**Note**: These practice problems will not be found on codeacademy - you
**must** setup the web based ruby development environment.

[setup]: ../../coding-test-1/setup.md

# Practice Problems II
We recommend that you continue to use the Cloud9 development
environment. See these [setup instructions][c9-setup].

[c9-setup]: ../../coding-test-1/setup.md

Alternatively, you might prefer to setup Ruby on your own computer. If
you choose to do so, you can download this whole prep-work repository,
including the practice problems, in [ZIP format][repo-zip].

These practice problems are meant to be written, and run through the
web based development environment. Please see the following instructions to get
started.

[repo-zip]: https://github.com/appacademy/prep-work/archive/master.zip

## Practice Problem Instructions

First, open a terminal at the
 `prep-work/coding-test-2/practice-problems` directory. If you are using
Cloud9, the easiest way to do this is to right-click on that directory
in the file tree and select "Open Terminal Here". Run `bundle install`.
This will install the Ruby libraries needed to run the specs.

You can then run the specs for an individual problem like so:

    bundle exec rspec spec/00_nearest_larger_spec.rb

The instructions for the practice problems are written inside the spec
files (in the `spec` directory); check those for instructions on what
you are supposed to do.

You will write your code in the corresponding files in `lib` (e.g.,
`lib/00_nearest_larger.rb`). I've filled them out with a blank method
for you. You'll need to write the code to make the specs pass. In
Cloud9, you'll probably want to keep one text editor panel open to write
your code, and a terminal panel open to run the specs and read the
specs' output.

Work through the problems one by one; when you complete writing the
code, run the spec to check your work. Make sure to look at the
results it returns; look at which individual tests fail and then start
to figure out why.

My advice is to solve them all once, then put your solutions away and
solve them all again a day later. You should build a good, intuitive
grasp of the techniques needed to solve these problems.

**I've included solutions**, but you shouldn't look at those until you
finish a problem (or get stuck).
