# frozen_string_literal: true

module Bitbucket
  class Audit
    include IssueParser

    def initialize(issue_content, _)
      @workspace = parameter_from_issue("Workspace", issue_content)
    end

    def to_a
      return if @workspace.nil?

      [["--workspace", @workspace]]
    end
  end
end
