# frozen_string_literal: true

module Bamboo
  class Audit
    include IssueParser

    def initialize(issue_content, _)
      @project = parameter_from_issue("Project", issue_content)
    end

    def to_a
      args = []
      args.push(["--project", @project]) unless @project.nil?

      return args unless args.empty?
    end
  end
end
