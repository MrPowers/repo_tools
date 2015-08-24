require 'spec_helper'

module RepoTools; describe Puller do

  context "integration" do
    it "actually clones a repo from GitHub and puts it in tmp" do
      root = File.expand_path("../", File.dirname(__FILE__))
      puller = RepoTools::Puller.new("git@github.com:MrPowers/frontend-generators.git", root, "test")
      puller.clean_and_clone
    end
  end

end; end

