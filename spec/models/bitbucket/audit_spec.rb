# frozen_string_literal: true

RSpec.describe Bitbucket::Audit do
  describe "#to_a" do
    let(:audit) { described_class.new(issue_content, command) }
    let(:command) { Command.new(comment_body) }
    let(:comment_body) { "/audit" }

    subject { audit.to_a }

    context "when issue_content contains no args" do
      let(:issue_content) do
        <<~ISSUE
          Workspace:
        ISSUE
      end

      it { is_expected.to be_nil }
    end

    context "when issue_content contains a workspace" do
      let(:issue_content) do
        <<~ISSUE
          Workspace: testing
        ISSUE
      end

      it { is_expected.to eq([["--workspace", "testing"]]) }
    end

    context "when the comment body contains a project key" do
      let(:issue_content) do
        <<~ISSUE
          Workspace: testing
        ISSUE
      end
      let(:comment_body) { "/audit --project-key SW" }

      it { is_expected.to eq([["--workspace", "testing"], ["--project-key", "SW"]]) }
    end
  end
end
