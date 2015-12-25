# TypedMap

TypedMap is a Hash with typed keys and values.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'typed_map'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install typed_map

## Usage

TypedMap is a very simple data structure. It provides only 4 methods that are described below:

```ruby
pathes = TypedMap.new ktype: Symbol, vtype: String

pathes.add :root, "/"
pathes.add "key", "val" # Error
pathes.add :key, :val   # Error

pathes.has? :root # => true
pathes.keys       # => [:root]
pathes[:root]     # => "/"

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/typed_map/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
