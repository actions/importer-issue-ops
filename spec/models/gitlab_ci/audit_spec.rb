# frozen_string_literal: true

RSpec.describe GitlabCI::Audit do
  let(:audit) { described_class.new(issue_content, nil) }

  describe "#to_a" do
    subject { audit.to_a }

    context "when issue_content contains no args" do
      let(:issue_content) do
        <<~ISSUE
          Namespace:
        ISSUE
      end

      it { is_expected.to be_nil }
    end

    context "when issue_content contains a namespace" do
      let(:issue_content) do
        <<~ISSUE
          Namespace: testing
        ISSUE
      end

      it { is_expected.to eq([["--namespace", "testing"]]) }
    end
  end
end
