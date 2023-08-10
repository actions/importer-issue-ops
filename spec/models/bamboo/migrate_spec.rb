# frozen_string_literal: true

RSpec.describe Bamboo::Migrate do
  let(:dry_run) { described_class.new(issue_content, command) }
  let(:command) { Command.new(comment_body) }

  describe "#to_a" do
    subject { dry_run.to_a }
    let(:issue_content) do
      <<~ISSUE
        Plan Slug: PAN-PLAN
      ISSUE
    end

    context "when the comment body does not contain a pipeline type" do
      let(:comment_body) { "/migrate" }

      it { is_expected.to eq(["build", ["--plan-slug", "PAN-PLAN"]]) }
    end

    context "when the comment body contains a plan type" do
      let(:comment_body) { "/dry-run --plan-type deployment" }

      it { is_expected.to eq(["deployment", ["--plan-slug", "PAN-PLAN"]]) }
    end

    context "with a target-url" do
      let(:comment_body) { "/migrate --target-url https://github.com/valet" }

      it { is_expected.to eq(["build", ["--plan-slug", "PAN-PLAN"], ["--target-url", "https://github.com/valet"]]) }
    end
  end
end
