# frozen_string_literal: true

RSpec.describe CircleCI::Migrate do
  let(:dry_run) { described_class.new(issue_content, command) }
  let(:command) { Command.new(comment_body) }

  describe "#to_a" do
    subject { dry_run.to_a }
    let(:issue_content) do
      <<~ISSUE
        Organization: testing
      ISSUE
    end

    context "when the comment body contains a project" do
      let(:comment_body) { "/migrate --project repo --target-url https://github.com/org/repo" }

      it { is_expected.to eq([["--circle-ci-organization", "testing"], ["--circle-ci-project", "repo"], ["--target-url", "https://github.com/org/repo"]]) }
    end
  end
end
