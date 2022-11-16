# frozen_string_literal: true

RSpec.describe Jenkins::Migrate do
  let(:dry_run) { described_class.new(nil, command) }
  let(:command) { Command.new(comment_body) }

  describe "#to_a" do
    subject { dry_run.to_a }

    context "when the comment body contains a pipeline id" do
      let(:comment_body) { "/migrate --source-url https://jenkins.company.com/job/pipeline --target-url https://github.com/org/repo" }

      it { is_expected.to eq(["--source-url", "https://jenkins.company.com/job/pipeline", "--target-url", "https://github.com/org/repo"]) }
    end

    context "when there are transformer files present" do
      before do
        allow(Dir).to receive(:glob).and_return(["transformers/transformer1.rb", "transformers/transformer2.rb"])
      end

      let(:comment_body) { "/dry-run --source-url https://jenkins.company.com/job/pipeline" }

      it { is_expected.to match_array(["--source-url", "https://jenkins.company.com/job/pipeline", "--custom-transformers", "transformers/transformer1.rb transformers/transformer2.rb"]) }
    end

    context "when the comment body contains a custom-transformer" do
      before do
        allow(Dir).to receive(:glob).and_return(["transformers/transformer1.rb", "transformers/transformer2.rb"])
      end

      let(:comment_body) { "/dry-run --source-url https://jenkins.company.com/job/pipeline --custom-transformers mytransformer.rb" }

      it { is_expected.to match_array(["--source-url", "https://jenkins.company.com/job/pipeline", "--custom-transformers", "mytransformer.rb"]) }
    end
  end
end
