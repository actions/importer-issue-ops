# frozen_string_literal: true

module CircleCI
  class Migrate
    include IssueParser

    def initialize(issue_content, command)
      @custom_transformers = command.options["custom-transformers"]
      @organization = parameter_from_issue("Organization", issue_content)
      @project = command.options["project"]
      @target_url = command.options["target-url"]
    end

    def to_a
      args = []
      args.concat(["--circle-ci-organization", @organization]) unless @organization.nil?
      args.concat(["--circle-ci-project", @project]) unless @project.nil?
      args.concat(["--custom-transformers", @custom_transformers]) unless @custom_transformers.nil?
      args.concat(["--target-url", @target_url]) unless @target_url.nil?

      return args unless args.empty?
    end
  end
end
