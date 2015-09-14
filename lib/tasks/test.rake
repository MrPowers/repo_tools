desc 'test whether repotools is working'
task :puller_test do
  root = Dir.pwd
  puller = RepoTools::Puller.new("git@github.com:MrPowers/frontend-generators.git", root, "test")
  puller.clean_and_clone
end
