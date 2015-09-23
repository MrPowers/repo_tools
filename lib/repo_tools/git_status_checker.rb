module RepoTools; class GitStatusChecker

  attr_reader :git_dirname

  def initialize(git_dirname)
    @git_dirname = git_dirname
  end

  def up_to_date?
    return false unless git_initialized?
    local_sha == remote_sha
  end

  def git_initialized?
    return false unless File.directory?(git_dirname)
    Dir.foreach(git_dirname).any? {|f| f == ".git"}
  end

  def local_sha
    `git --git-dir #{git_dirname}/.git rev-parse master`
  end

  def remote_sha
    `git -C #{git_dirname} remote update`
    `git -C #{git_dirname} rev-parse origin/master`
  end

end; end

