# frozen_string_literal: true

module GitlabCI
  class DryRun
    include IssueParser

    def initialize(issue_content, command)
      @custom_transformers = command.options["custom-transformers"] || Dir.glob("transformers/**/*.rb").join(" ")
      @namespace = parameter_from_issue("Namespace", issue_content)
      @project = command.options["project"]
    end

    def to_a
      args = []
      args.concat(["--custom-transformers", @custom_transformers]) if @custom_transformers.length.positive?
      args.concat(["--namespace", @namespace]) unless @namespace.nil?
      args.concat(["--project", @project]) unless @project.nil?

      return args unless args.empty?
    end
  end
end
