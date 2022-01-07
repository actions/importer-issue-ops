# frozen_string_literal: true

RSpec.describe Arguments do
  let(:arguments) { Arguments.new(provider, command, issue_content) }
  let(:provider) { instance_double(Provider) }
  let(:command) { instance_double(Command) }
  let(:issue_content) { "some issue content" }

  describe "#argument_class" do
    subject { arguments.argument_class(provider, command, issue_content) }

    context "when the command is found" do
      before do
        expect(provider).to receive(:module).and_return(::Jenkins).at_least(:once)
        expect(command).to receive(:classify).and_return("Audit").at_least(:once)
      end

      it { is_expected.to be_a(::Jenkins::Audit) }
    end

    context "when the command is not found" do
      before do
        expect(provider).to receive(:module).and_return(::Jenkins).at_least(:once)
        expect(command).to receive(:classify).and_return("Whoopsie").at_least(:once)
      end

      it { expect { subject }.to raise_error(NameError) }
    end
  end

  describe "#to_output" do
    subject { arguments.to_output }

    before do
      expect(provider).to receive(:module).and_return(::AzureDevops).at_least(:once)
      expect(command).to receive(:classify).and_return("Audit").at_least(:once)
      expect_any_instance_of(::AzureDevops::Audit).to receive(:to_a).and_return(output)
    end

    context "when the output is nil" do
      let(:output) { nil }

      it "does not write any output variable" do
        expect(arguments).not_to receive(:set_output)
        subject
      end
    end

    context "when the output is not nil" do
      let(:output) { ["--option", "value"] }

      it "writes an output variable" do
        expect(arguments).to receive(:set_output).with("args", "--option value")
        subject
      end
    end

    context "when the output contains a space" do
      let(:output) { ["--option", "some value"] }

      it "writes an output variable" do
        expect(arguments).to receive(:set_output).with("args", "--option \"some value\"")
        subject
      end
    end
  end
end
