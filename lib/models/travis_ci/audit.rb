# frozen_string_literal: true

module TravisCI
  class Audit
    include IssueParser

    def initialize(issue_content, _)
      @organization = parameter_from_issue("Organization", issue_content)
    end

    def to_a
      return if @organization.nil?

      [["--travis-ci-organization", @organization]]
    end
  end
end
