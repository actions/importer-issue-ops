# frozen_string_literal: true

RSpec.describe Provider do
  let(:provider) { described_class.new(labels) }

  describe "#initialize" do
    subject { provider }

    context "when no providers are selected" do
      let(:labels) do
        <<~LABELS
          []
        LABELS
      end

      it { expect { subject }.to raise_error("One provider must be selected") }
    end

    context "when multiple providers are selected" do
      let(:labels) do
        <<~LABELS
          [
            "jenkins",
            "azure-devops"
          ]
        LABELS
      end

      it { expect { subject }.to raise_error("Only one provider can be selected") }
    end

    context "when an unsupported provider is selected" do
      let(:labels) do
        <<~LABELS
          [
            "something-unsupported"
          ]
        LABELS
      end

      it { expect { subject }.to raise_error("One provider must be selected") }
    end

    context "when a single provider is selected" do
      let(:labels) do
        <<~LABELS
          [
            "jenkins"
          ]
        LABELS
      end

      it { expect { subject }.not_to raise_error }
    end

    context "when a provider is a quoted string" do
      let(:labels) { "[ \"jenkins\" ]" }

      it { expect { subject }.not_to raise_error }
    end
  end

  describe "#cli_command" do
    subject { provider.cli_command }
    let(:labels) do
      <<~LABELS
        [
          "gitlab"
        ]
      LABELS
    end

    it { is_expected.to eq("gitlab") }
  end

  describe "#module" do
    subject { provider.module }

    let(:labels) do
      <<~LABELS
        [
          "travis-ci"
        ]
      LABELS
    end

    it { is_expected.to eq(TravisCI) }
  end

  describe "to_output" do
    subject { provider.to_output }

    let(:labels) do
      <<~LABELS
        [
          "azure-devops"
        ]
      LABELS
    end

    it { expect { subject }.to change { File.readlines(ENV["GITHUB_OUTPUT"], chomp: true).last }.to("provider=azure-devops") }
  end
end
