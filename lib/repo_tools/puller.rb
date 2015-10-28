module RepoTools; class Puller

  attr_reader :ssh_clone_url

  def initialize(args)
    @ssh_clone_url = args.fetch(:ssh_clone_url)
    @destination_dirname = args.fetch(:destination_dirname)
  end

  def clean_and_clone
    return if git_status_checker.up_to_date?
    FileUtils.rm_rf destination_dirname
    clone
  end

  def git_status_checker
    GitStatusChecker.new(destination_dirname)
  end

  def clone
    `git clone #{ssh_clone_url} #{destination_dirname}`
  end

  def destination_dirname
    p = Pathname.new(@destination_dirname)
    FileUtils.mkdir_p(p.dirname)
    p
  end

  def project_name
    ssh_clone_url.match(/\/((\w|\-)+)/)[1]
  end

end; end

