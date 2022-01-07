# frozen_string_literal: true

module TravisCI
  class Migrate
    include IssueParser

    def initialize(issue_content, command)
      @organization = parameter_from_issue("Organization", issue_content)
      @repository = command.options["repository"]
      @target_url = command.options["target-url"]
    end

    def to_a
      args = []
      args.concat(["--travis-ci-organization", @organization]) unless @organization.nil?
      args.concat(["--travis-ci-repository", @repository]) unless @repository.nil?
      args.concat(["--target-url", @target_url]) unless @target_url.nil?

      return args unless args.empty?
    end
  end
end
