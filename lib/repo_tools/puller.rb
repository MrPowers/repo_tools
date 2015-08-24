module RepoTools; class Puller

  attr_reader :ssh_clone_url, :project_root, :environment

  def initialize(ssh_clone_url, project_root, environment)
    @ssh_clone_url = ssh_clone_url
    @project_root = project_root
    @environment = environment
  end

  def clean_and_clone
    FileUtils.rm_rf destination_dirname
    clone
    log_clone
  end

  def clone
    `git clone #{ssh_clone_url} #{destination_dirname}`
  end

  def log_clone
    File.open(log, 'a') do |f|
      f.puts "[#{Time.now.utc.iso8601}]: #{project_name} was cloned"
    end
  end

  def destination_dirname
    p = Pathname.new(project_root).join('tmp', environment, project_name)
    FileUtils.mkdir_p(p.dirname)
    p
  end

  def project_name
    ssh_clone_url.match(/\/((\w|\-)+)/)[1]
  end

  def log
    p = Pathname.new(project_root).join('log', environment).join("#{project_name}.log")
    FileUtils.mkdir_p(p.dirname)
    FileUtils.touch(p)
    p
  end

end; end

