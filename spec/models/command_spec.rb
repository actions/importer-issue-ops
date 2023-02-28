# frozen_string_literal: true

RSpec.describe Command do
  let(:command) { described_class.new(comment_body) }

  describe "#command" do
    subject { command.command }

    context "when no command is present" do
      let(:comment_body) do
        <<~COMMENT
          This is just a comment.
        COMMENT
      end

      it { is_expected.to be_nil }
    end

    context "when an unsupported comment is present" do
      let(:comment_body) do
        <<~COMMENT
          /do-something-unsupported
        COMMENT
      end

      it { is_expected.to be_nil }
    end

    described_class::VALID_COMMANDS.each do |c|
      context "when a supported command is present" do
        let(:comment_body) do
          <<~COMMENT
            /#{c}
          COMMENT
        end

        it { is_expected.to eq(c) }
      end
    end
  end

  describe "#options" do
    subject { command.options }

    context "when the command is not valid" do
      let(:comment_body) { "/do-something-unsupported --option-one value" }

      it { is_expected.to be_nil }
    end

    context "when no options are present" do
      let(:comment_body) { "/dry-run" }

      it { is_expected.to be_blank }
    end

    context "when options are present" do
      let(:comment_body) { "/dry-run --option-one value-one --option-two value-two" }

      it { is_expected.to eq({ "option-one" => "value-one", "option-two" => "value-two" }) }
    end
  end

  describe "#valid?" do
    subject { command.valid? }

    context "when the command is supported" do
      let(:comment_body) { "/dry-run" }

      it { is_expected.to be_truthy }
    end

    context "when the command is not supported" do
      let(:comment_body) { "/run-something-else" }

      it { is_expected.to be_falsey }
    end
  end

  describe "#classify" do
    subject { command.classify }

    [%w[audit Audit], %w[dry-run DryRun], %w[migrate Migrate]].each do |command, klass|
      context "when the command is #{command}" do
        let(:comment_body) { "/#{command}" }

        it { is_expected.to eq(klass) }
      end
    end

    context "when the command is invalid" do
      let(:comment_body) { "/do-something-unsupported" }

      it { is_expected.to be_nil }
    end
  end

  describe "to_output" do
    subject { command.to_output }

    let(:comment_body) do
      <<~COMMENT
        /audit
      COMMENT
    end

    it { expect { subject }.to change { File.readlines(ENV["GITHUB_OUTPUT"], chomp: true).last }.to("command=audit") }
  end
end
