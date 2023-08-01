# frozen_string_literal: true

RSpec.describe GitlabCI::DryRun do
  let(:dry_run) { described_class.new(issue_content, command) }
  let(:command) { Command.new(comment_body) }

  describe "#to_a" do
    subject { dry_run.to_a }
    let(:issue_content) do
      <<~ISSUE
        Namespace: testing
      ISSUE
    end

    context "when the comment body contains a pipeline id" do
      let(:comment_body) { "/dry-run --project project" }

      it { is_expected.to eq([["--namespace", "testing"], ["--project", "project"]]) }
    end
  end
end
