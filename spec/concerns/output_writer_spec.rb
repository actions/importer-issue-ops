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

    subject { test_class.set_output(name, value) }

    it { expect { subject }.to output(/::set-output name=#{name}::#{value}/).to_stdout }

    context "when value is nil" do
      let(:value) { nil }

      it { expect { subject }.not_to output(/::set-output name=#{name}::#{value}/).to_stdout }
    end
  end
end
