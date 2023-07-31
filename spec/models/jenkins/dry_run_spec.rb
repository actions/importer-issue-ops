# frozen_string_literal: true

RSpec.describe Jenkins::DryRun do
  let(:dry_run) { described_class.new(nil, command) }
  let(:command) { Command.new(comment_body) }

  describe "#to_a" do
    subject { dry_run.to_a }

    context "when the comment body contains a pipeline id" do
      let(:comment_body) { "/dry-run --source-url https://jenkins.company.com/job/pipeline" }

      it { is_expected.to eq([["--source-url", "https://jenkins.company.com/job/pipeline"]]) }
    end
  end
end
