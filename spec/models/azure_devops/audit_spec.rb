# frozen_string_literal: true

RSpec.describe AzureDevops::Audit do
  let(:audit) { described_class.new(issue_content, nil) }

  describe "#to_a" do
    subject { audit.to_a }

    context "when issue_content contains no args" do
      let(:issue_content) do
        <<~ISSUE
          Organization:
          Project:
        ISSUE
      end

      it { is_expected.to be_nil }
    end

    context "when issue_content contains an organization" do
      let(:issue_content) do
        <<~ISSUE
          Organization: my-organization
          Project:
        ISSUE
      end

      it { is_expected.to eq([["--azure-devops-organization", "my-organization"]]) }
    end

    context "when issue_content contains a project" do
      let(:issue_content) do
        <<~ISSUE
          Organization: my-organization
          Project: my-project
        ISSUE
      end

      it { is_expected.to eq([["--azure-devops-organization", "my-organization"], ["--azure-devops-project", "my-project"]]) }
    end
  end
end
