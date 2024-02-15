# frozen_string_literal: true

module Bitbucket
  class Audit
    include IssueParser

    def initialize(issue_content, command)
      @workspace = parameter_from_issue("Workspace", issue_content)

      @project_key = command.options["project-key"]
    end

    def to_a
      args = []
      args.push(["--workspace", @workspace]) unless @workspace.nil?
      args.push(["--project-key", @project_key]) unless @project_key.nil?

      return args unless args.empty?
    end
  end
end
