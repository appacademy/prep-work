# Source files

Code is organized into source files; each file contains a collection
of related code. When source files start to get long (>300 lines or
so), it is good practice to split the code up into new files.

Code in a source file should all be for a coherent purpose. We haven't
seen Ruby classes yet, but a typical source file contains the
definition of a single class.

Your early files should probably contain just the code for the
problems in the current chapter. You may wish to name them
`object_exercises.rb`, `string_exercises.rb`, etc. The `.rb` is not
vital, but it will signal to Atom that it is dealing with a Ruby
file.

Once your code is in files, you will want to be able to load them. Use
the `require` method:

```
~$ irb
[1] pry(main)> require 'set'
=> true
[2] pry(main)> Set.new([1, 2, 3]) # let's me use the `Set` class
=> #<Set: {1, 2, 3}>
```

This won't quite work for your own code; only code in installed
*gems* (bundles of code distributed on the internet) can be loaded
without first giving a path:

```
~$ touch test.rb
~$ irb
[1] pry(main)> require 'test'
LoadError: cannot load such file -- test
        from: /Users/ruggeri/.rvm/rubies/ruby-1.9.3-p194/lib/ruby/site_ruby/1.9.1/rubygems/custom_require.rb:36:in `require'
        from: /Users/ruggeri/.rvm/rubies/ruby-1.9.3-p194/lib/ruby/site_ruby/1.9.1/rubygems/custom_require.rb:36:in `require'
        from: (pry):1:in `__pry__'
[2] pry(main)> require './test'
=> true
```

The `.` means that the source file named `test` can be found in the
current directory. Ruby will add the `.rb` bit when you use `require`.

You may notice that changes in re-`require`ing code in the REPL won't
reload the library:

```
~$ irb
[1] pry(main)> require './test'
=> true
[2] pry(main)> require './test' # won't reload
=> false
[3] pry(main)> load './test.rb' # load will *always* reload
=> true
```

`require` tries to be smart and not reload things it already has
loaded; this can make it *substantially* faster. If you try to
re-`require`, the method will return `false` to indicate what
happened.

The solution is to use `load`, which will always try to reload a
file. You should only use this in the REPL; don't use load in your
source files. But if you don't want to reload everything in the REPL,
`load` is your solution.

Note that `load` expects and requires the `.rb` extension.
