# frozen_string_literal: true

RSpec.describe Jenkins::DryRun do
  let(:dry_run) { described_class.new(nil, command) }
  let(:command) { Command.new(comment_body) }

  describe "#to_a" do
    subject { dry_run.to_a }

    context "when the comment body contains a pipeline id" do
      let(:comment_body) { "/dry-run --source-url https://jenkins.company.com/job/pipeline" }

      it { is_expected.to eq(["--source-url", "https://jenkins.company.com/job/pipeline"]) }
    end

    context "when the comment body contains a custom-transformer" do
      let(:comment_body) { "/dry-run --source-url https://jenkins.company.com/job/pipeline --custom-transformers mytransformer.rb" }

      it { is_expected.to match_array(["--source-url", "https://jenkins.company.com/job/pipeline", "--custom-transformers", "mytransformer.rb"]) }
    end
  end
end
