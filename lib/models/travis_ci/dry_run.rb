# frozen_string_literal: true

module TravisCI
  class DryRun
    include IssueParser

    def initialize(issue_content, command)
      @organization = parameter_from_issue("Organization", issue_content)
      @repository = command.options["repository"]
    end

    def to_a
      args = []
      args.push(["--travis-ci-organization", @organization]) unless @organization.nil?
      args.push(["--travis-ci-repository", @repository]) unless @repository.nil?

      return args unless args.empty?
    end
  end
end
