# frozen_string_literal: true

module GitlabCI
  class Audit
    include IssueParser

    def initialize(issue_content, _)
      @namespace = parameter_from_issue("Namespace", issue_content)
    end

    def to_a
      return if @namespace.nil?

      [["--namespace", @namespace]]
    end
  end
end
