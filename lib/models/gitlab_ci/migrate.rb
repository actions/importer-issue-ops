# frozen_string_literal: true

module GitlabCI
  class Migrate
    include IssueParser

    def initialize(issue_content, command)
      @namespace = parameter_from_issue("Namespace", issue_content)
      @project = command.options["project"]
      @target_url = command.options["target-url"]
    end

    def to_a
      args = []
      args.push(["--namespace", @namespace]) unless @namespace.nil?
      args.push(["--project", @project]) unless @project.nil?
      args.push(["--target-url", @target_url]) unless @target_url.nil?

      return args unless args.empty?
    end
  end
end
