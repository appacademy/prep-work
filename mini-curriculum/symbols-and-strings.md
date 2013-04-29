# Symbols and Strings

## Goals

* Know when to use `Symbol` instead of `String`.
* Know how to write a method that takes an options `Hash`.

## `Symbol`

Ruby has distinct `Symbol` and `String` classes. They are similar, but
used in different contexts.

You are familiar with `String`s. They represent a sequence of
characters. When you read text from a file, or the user, you get a
`String`. When you `puts` an object, it is first converted to a
`String` (via the `#to_s` method) and the written to the output. You
have read about the various methods to concatenate,
format/interpolate, split, and otherwise manipulate text.

`Symbol`s are similar to `String`s. The difference is that `Symbol`s
aren't meant to be manipulated like text: there isn't a particularly
easy way to concatenate `Symbol`s, or to split them on whitespace,
etc. In fact, `Symbol`s can't be modified; they're
[*immutable*][immutable-wiki]. `Symbol`s are used to represent names (key names, option
names, method names) inside the Ruby interpreter; they aren't intended
for input or output. (If you want to generate a symbol from an input, you
can call Ruby's handy #to_sym method on any string object.)

```ruby
{ :name => "Breakfast", :species => "Cat", :owner => "Devon" }
RestClient.post("appacademy.io/applications/new",
    app.to_json, :content_type => :json)
[1, 2, 3].map(&:even?) # => [false, true, false]
```

The first example shows a `Hash`, where the keys are `Symbol`s. The
second shows a method call which passes an optional, *named*
parameter: the content type of the upload is JSON. The last shows a
call to `map` where we ask `#even?` to be called on each element
(we'll see the `&`, or `to_proc`, in a later chapter).

Because `Symbol`s start with a `:`, they are faster to type. They also
make clear the intent of your program. You should use them whenever
you aren't representing data that should be input or output.

[immutable-wiki]:https://en.wikipedia.org/wiki/Immutable_object

## Option hashes

It is common that you may have a method which takes many arguments; it
can be tedious (and error-prone) to remember the order of these many
options. Moreover, many of them may have defaults values, so a number
of these may be optional.

As you know, Ruby method arguments are *positional*; they must be
provided in the correct order. But Ruby also has a means to let you
pass arguments by *name*. An example is more easily understood:

```ruby
def brittle_format_url(scheme, host, path, query_values)
  # ...
end

# have to remember to supply arguments in order
# no defaults. ugh.
brittle_format_url("http", "www.google.com", "/search", {
    :search_query => "mitt romney, how many sons?"
  })

def better_format_url(options = {})
  defaults = {
    :scheme => "http",
    :path => "/",
    :query_hash => {}
  }
  
  options = defaults.merge(options)
  
  # the query string is the part that comes after the '?' in a URL
  # like http://bing.com/search?q=this+is+my+search
  # this query string represents { :q => "this is my search }.
  # I'm using a hypothetical method `format_query_string` to turn
  # a hash to a query string.
  query_string = format_query_string(options[:query_hash])
  "#{options[:scheme]}://#{options[:path]}?#{query_string}"
end

better_format_url({
    :scheme => "http",
    :host => "www.google.com",
    :path => "/search"
    :query_hash => {
      :search_query => "mitt romney, how many sons?"
    }
  })

# defaults for scheme ("http"), path ("/"), query_hash ({})
better_format_url({:host => "www.nytimes.com"})
```

Hopefully it is clear that the `better_format_url` is more convenient
and flexible. There's no magic to it: we just pass in a `Hash`, where
the params are keyed by names. Notice, that when merging, the values
in `options` will override the values in `defaults`. Of course, we use
`Symbol`s for the keys.

Because this is so convenient, Ruby lets us remove the braces around
this options hash:

```Ruby
# look Ma, no braces
better_format(:scheme => "https", :host => "api.facebook.com")
# => better_format({ :scheme => "https", ... })
```

Methods may take a mix of positional and optional arguments. After all
of the positional arguments, we can put in the `key => value` pairs,
separated by commas. Ruby will collect these into a `Hash`, then pass
this to the method as the last argument. Another example:

```ruby
def do_something(required_arg1, required_arg2, options = {})
  # it's typical to give a default value for options in case no
  # options are passed
  
  # ...
end

do_something(arg1, arg2, :option1 => value1, :option2 => value2)
```
Another example: this comes from a blog (http://blog.ethanvizitei.com/ by Ethan Vizitei)
```ruby
class SweetPhone
  def ring!(options = {})
    adjust_volume(options[:volume] || 6)
    ringtone = pick_ringtone_from_category(options[:ringtone] || :all)
    sound_the_ringer!(ringtone)
  end
end
```


## Exercises

Estimated time: .25hrs

* Write a method `super_print` that takes a `String`. It should take
  optional parameters `:times`, `:upcase`, `:reverse`. Pick reasonable
  [defaults](http://stackoverflow.com/a/977546).
    * Please note, the `:times` parameter's value should be an integer that the #times method will be called on.

## Resources

* [About.com on options](http://ruby.about.com/od/advancedruby/qt/opthash.htm)
