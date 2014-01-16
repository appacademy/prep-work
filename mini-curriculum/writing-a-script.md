# Writing a Ruby Script

Some Ruby source files contain definitions of classes and methods meant to be
loaded by other Ruby code (called *library* files), while others are intended
to be executed as a program (called *script* files).

If you have a file `script.rb`, our goal is to invoke the file by typing
`./script.rb`. The first step is to add a line which tells the "shell" (bash
or zsh) to use the Ruby interpreter to run the code:

```ruby
#!/usr/bin/env ruby

puts "Hello from Ruby!"
```

The first line tells the shell to use the Ruby interpreter to run the
program. If you had written `#!/usr/bin/env perl` it would run your program
with the Perl interpreter. Without this, the shell will interpret your
program as a shell script by default.

Next, we need to make the file *executable*, which tells the shell that the
file is safe to execute as a program. For instance, you wouldn't want to run
a Word document as a program. To do this, run `chmod +x script.rb` (the 'x'
means *executable*).

You should now be able to run `./script.rb`.

### Conditional execution

Sometimes you want to write a Ruby file that can be used as a library, but
also invoked as a script. This is especially true if you'd like to `require` your
script to test out in irb.

```ruby
#!/usr/bin/env ruby

def say_hello(name)
  puts "Hey there, #{name}!"
end

if $PROGRAM_NAME == __FILE__
  name = gets.chomp
  say_hello(name)
end
```

`__FILE__` is a special variable which holds the name of the Ruby source
file, `hello.rb`. `$PROGRAM_NAME` is a special variable that contains the
name of the executing program. If you invoke `./hello.rb` as a script, this
will be `./hello.rb`.

Only if you run `./hello.rb` will the two be equal, in which case the script
code is run.

If you merely load the script from pry, `$PROGRAM_NAME` will be `"pry"`; the
two will not be equal, and the script code won't run; only the `say_hello`
method will be defined.

This is desirable, because if you just want to load your code in pry so you
can test, you don't want your script code to start executing right away on
you.
