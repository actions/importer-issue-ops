# frozen_string_literal: true

module CircleCI
  class DryRun
    include IssueParser

    def initialize(issue_content, command)
      @organization = parameter_from_issue("Organization", issue_content)
      @project = command.options["project"]
    end

    def to_a
      args = []
      args.push(["--circle-ci-organization", @organization]) unless @organization.nil?
      args.push(["--circle-ci-project", @project]) unless @project.nil?

      return args unless args.empty?
    end
  end
end
