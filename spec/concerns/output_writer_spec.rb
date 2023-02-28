# frozen_string_literal: true

RSpec.describe OutputWriter do
  let(:test_class) do
    class TestClass
      include OutputWriter
    end

    TestClass.new
  end

  describe "#set_output" do
    let(:name) { "var_name" }
    let(:value) { "var_value" }
    let(:output) { "#{name}=#{value}" }

    subject { test_class.set_output(name, value) }

    it { expect { subject }.to change { File.readlines(ENV["GITHUB_OUTPUT"], chomp: true).last }.to(/#{output}/) }

    context "when value is nil" do
      let(:value) { nil }

      it { expect { subject }.not_to change { File.read(ENV["GITHUB_OUTPUT"], chomp: true).last } }
    end
  end
end
