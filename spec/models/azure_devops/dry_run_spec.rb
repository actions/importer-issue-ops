# frozen_string_literal: true

RSpec.describe AzureDevops::DryRun do
  let(:dry_run) { described_class.new(issue_content, command) }
  let(:command) { Command.new(comment_body) }

  describe "#to_a" do
    subject { dry_run.to_a }
    let(:issue_content) do
      <<~ISSUE
        Organization: my-organization
        Project: my-project
      ISSUE
    end

    context "when the comment body does not contain a pipeline type" do
      let(:comment_body) { "/dry-run" }

      it { is_expected.to eq(["pipeline", "--azure-devops-organization", "my-organization", "--azure-devops-project", "my-project"]) }
    end

    context "when the comment body contains a pipeline id" do
      let(:comment_body) { "/dry-run --pipeline-id 42" }

      it { is_expected.to eq(["pipeline", "--azure-devops-organization", "my-organization", "--azure-devops-project", "my-project", "--pipeline-id", "42"]) }
    end

    context "when the comment body contains a custom-transformer" do
      before do
        allow(Dir).to receive(:glob).and_return(["transformers/transformer1.rb", "transformers/transformer2.rb"])
      end

      let(:comment_body) { "/dry-run --custom-transformers mytransformer.rb" }

      it { is_expected.to match_array(["pipeline", "--azure-devops-organization", "my-organization", "--azure-devops-project", "my-project", "--custom-transformers", "mytransformer.rb"]) }
    end

    context "when there are transformer files present" do
      before do
        allow(Dir).to receive(:glob).and_return(["transformers/transformer1.rb", "transformers/transformer2.rb"])
      end

      let(:comment_body) { "/dry-run" }

      it { is_expected.to match_array(["pipeline", "--azure-devops-organization", "my-organization", "--azure-devops-project", "my-project", "--custom-transformers", "transformers/transformer1.rb transformers/transformer2.rb"]) }
    end
  end
end
