# frozen_string_literal: true

module GitlabCI
  class Migrate
    include IssueParser

    def initialize(issue_content, command)
      @namespace = parameter_from_issue("Namespace", issue_content)
      @project = command.options["project"]
      @target_url = command.options["target-url"]
      @custom_transformers = command.options["custom-transformers"] || Dir.glob("transformers/**/*.rb").join(" ")
    end

    def to_a
      args = []
      args.concat(["--namespace", @namespace]) unless @namespace.nil?
      args.concat(["--project", @project]) unless @project.nil?
      args.concat(["--target-url", @target_url]) unless @target_url.nil?
      args.concat(["--custom-transformers", @custom_transformers]) if @custom_transformers.length.positive?

      return args unless args.empty?
    end
  end
end
