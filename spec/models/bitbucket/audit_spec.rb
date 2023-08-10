# frozen_string_literal: true

RSpec.describe Bitbucket::Audit do
  let(:audit) { described_class.new(issue_content, nil) }

  describe "#to_a" do
    subject { audit.to_a }

    context "when issue_content contains no args" do
      let(:issue_content) do
        <<~ISSUE
          Workspace:
        ISSUE
      end

      it { is_expected.to be_nil }
    end

    context "when issue_content contains a organization" do
      let(:issue_content) do
        <<~ISSUE
          Workspace: testing
        ISSUE
      end

      it { is_expected.to eq([["--workspace", "testing"]]) }
    end
  end
end
