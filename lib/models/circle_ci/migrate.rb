# frozen_string_literal: true

module CircleCI
  class Migrate
    include IssueParser

    def initialize(issue_content, command)
      @organization = parameter_from_issue("Organization", issue_content)
      @project = command.options["project"]
      @target_url = command.options["target-url"]
    end

    def to_a
      args = []
      args.push(["--circle-ci-organization", @organization]) unless @organization.nil?
      args.push(["--circle-ci-project", @project]) unless @project.nil?
      args.push(["--target-url", @target_url]) unless @target_url.nil?

      return args unless args.empty?
    end
  end
end
