require 'spec_helper'

module RepoTools; describe GitStatusChecker do

  context "#git_initialized?" do
    it "returns false for a regular directory" do
      p = File.expand_path("./support/regular_directory/", File.dirname(__FILE__))
      checker = GitStatusChecker.new(p)
      expect(checker.git_initialized?).to eq false
    end

    it "returns true for a git initialized directory" do
      p = File.expand_path("./support/git_directory/", File.dirname(__FILE__))
      checker = GitStatusChecker.new(p)
      expect(checker.git_initialized?).to eq true
    end

    it "returns false when the directory doesn't exist" do
      p = File.expand_path("./support/fake/not_there/", File.dirname(__FILE__))
      checker = GitStatusChecker.new(p)
      expect(checker.git_initialized?).to eq false
    end
  end

end; end

