# frozen_string_literal: true

RSpec.describe Jenkins::Audit do
  let(:audit) { described_class.new(issue_content, nil) }

  describe "#to_a" do
    subject { audit.to_a }

    context "when issue_content contains no args" do
      let(:issue_content) do
        <<~ISSUE
          Folders:
        ISSUE
      end

      it { is_expected.to be_nil }
    end

    context "when issue_content contains a folder" do
      let(:issue_content) do
        <<~ISSUE
          Folders: test, prod
        ISSUE
      end

      it { is_expected.to eq([["--folders", "test, prod"]]) }
    end
  end
end
