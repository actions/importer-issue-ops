# frozen_string_literal: true

RSpec.describe Bamboo::Audit do
  let(:audit) { described_class.new(issue_content, nil) }

  describe "#to_a" do
    subject { audit.to_a }

    context "when issue_content contains no args" do
      let(:issue_content) do
        <<~ISSUE
          Project:
        ISSUE
      end

      it { is_expected.to be_nil }
    end

    context "when issue_content contains a project" do
      let(:issue_content) do
        <<~ISSUE
          Project: Demo
        ISSUE
      end

      it { is_expected.to eq([["--project", "Demo"]]) }
    end
  end
end
