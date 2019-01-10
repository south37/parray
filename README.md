# PArray
Convert enumerable objects into **p**arallelized **array**s.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'parray'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install parray

## Usage

By using `parallelize`, you can convert enumerable objects into parallelized arrays. In enumerable operations, parallelized arrays use multiple threads to execute each block concurrently. The default size of threads is 2.

```ruby
[1] pry(main)> include PArray::API

[2] pry(main)> a = parallelize([1, 2, 3])
=> #<PArray:0x00007fd786872840 @arr=[1, 2, 3], @in_threads=2>

[3] pry(main)> a.map { |i| sleep(rand); p i; i * 2 }
2
3
1
=> [2, 4, 6]
```

You can also use `PArray.parallelize` to convert enumerable objects.

```ruby
[1] pry(main)> a = PArray.parallelize([1, 2, 3])
=> #<PArray:0x00007fd7863283a8 @arr=[1, 2, 3], @in_threads=2>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake true` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/south37/parray.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
