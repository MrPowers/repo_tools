desc 'clone a git repo locally to make sure repo_tools is working'
task :puller_test do
  root = Dir.pwd
  args = {
    ssh_clone_url: "git@github.com:MrPowers/frontend-generators.git",
    destination_dirname: "#{root}/test/"
  }
  puller = RepoTools::Puller.new(args)
  puller.clean_and_clone
end
