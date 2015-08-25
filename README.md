# RepoTools

The RepoTools gem can be used to clone Git repositories into a local application and only reclone the Git repository when it is behind origin/master.

## Usage

The following code will clone the `frontend-generators` in the `/root/path/tmp/test/frontend-generators` directory:

```ruby
puller = RepoTools::Puller.new("git@github.com:MrPowers/frontend-generators.git", "/root/path", "test")
puller.clean_and_clone
```

If origin/master stays the same and you run `#clean_and_clone` again, the repo will not be cloned again (because cloning is an expensive operation).

If origin/master is updated, then the repo will be re-cloned.  This code will cause the repo to be re-cloned for example:

```
cd /root/path/tmp/test/frontend-generators
git reset --hard HEAD~4
```

```ruby
puller = RepoTools::Puller.new("git@github.com:MrPowers/frontend-generators.git", "/root/path", "test")
puller.clean_and_clone
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'repo_tools'
```

And then execute:

    $ bundle

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MrPowers/repo_tools.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

