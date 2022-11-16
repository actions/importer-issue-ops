# frozen_string_literal: true

module TravisCI
  class DryRun
    include IssueParser

    def initialize(issue_content, command)
      @custom_transformers = command.options["custom-transformers"] || Dir.glob("transformers/**/*.rb").join(" ")
      @organization = parameter_from_issue("Organization", issue_content)
      @repository = command.options["repository"]
    end

    def to_a
      args = []
      args.concat(["--custom-transformers", @custom_transformers]) if @custom_transformers.length.positive?
      args.concat(["--travis-ci-organization", @organization]) unless @organization.nil?
      args.concat(["--travis-ci-repository", @repository]) unless @repository.nil?

      return args unless args.empty?
    end
  end
end
