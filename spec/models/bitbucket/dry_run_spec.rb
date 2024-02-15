# frozen_string_literal: true

RSpec.describe Bitbucket::DryRun do
  let(:dry_run) { described_class.new(issue_content, command) }
  let(:command) { Command.new(comment_body) }

  describe "#to_a" do
    subject { dry_run.to_a }
    let(:issue_content) do
      <<~ISSUE
        Workspace: testing
      ISSUE
    end

    context "when the comment body contains a repository" do
      let(:comment_body) { "/dry-run --repository repo" }

      it { is_expected.to eq([["--workspace", "testing"], ["--repository", "repo"]]) }
    end
  end
end
