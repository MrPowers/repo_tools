require "bundler/gem_tasks"
require "rspec/core/rake_task"
require_relative 'lib/repo_tools'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

Dir["lib/tasks/**/*.rake"].each { |ext| load ext }
