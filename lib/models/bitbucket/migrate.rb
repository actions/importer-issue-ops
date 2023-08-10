# frozen_string_literal: true

module Bitbucket
  class Migrate
    include IssueParser

    def initialize(issue_content, command)
      @workspace = parameter_from_issue("Workspace", issue_content)
      @repository = command.options["repository"]
      @target_url = command.options["target-url"]
    end

    def to_a
      args = []
      args.push(["--workspace", @workspace]) unless @workspace.nil?
      args.push(["--repository", @repository]) unless @repository.nil?
      args.push(["--target-url", @target_url]) unless @target_url.nil?

      return args unless args.empty?
    end
  end
end
