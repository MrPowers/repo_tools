# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'repo_tools/version'

Gem::Specification.new do |spec|
  spec.name          = "repo_tools"
  spec.version       = RepoTools::VERSION
  spec.authors       = ["MrPowers"]
  spec.email         = ["matthewkevinpowers@gmail.com"]

  spec.summary       = %q{Clone Git repos locally for use in your project}
  spec.description   = %q{Smartly manage cloned Git repos in your project.  For example, only clone the repo if it's behind the latest master commit.}
  spec.homepage      = "https://github.com/MrPowers/repo_tools"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
