# frozen_string_literal: true

RSpec.describe EnvironmentWriter do
  let(:test_class) do
    class TestClass
      include EnvironmentWriter
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

    context "when value contains a newline" do
      let(:value) { "var_value\n" }

      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end

  describe "#set_environment" do
    let(:name) { "env_var_name" }
    let(:value) { "env_var_value" }
    let(:output) { "#{name}=#{value}" }

    subject { test_class.set_environment(name, value) }

    it { expect { subject }.to change { File.readlines(ENV["GITHUB_ENV"], chomp: true).last }.to(/#{output}/) }

    context "when value is nil" do
      let(:value) { nil }

      it { expect { subject }.not_to change { File.read(ENV["GITHUB_ENV"], chomp: true).last } }
    end

    context "when value contains a newline" do
      let(:value) { "env_var_value\n" }

      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end
end
