# frozen_string_literal: true

module AzureDevops
  class Migrate
    include IssueParser

    def initialize(issue_content, command)
      @custom_transformers = command.options["custom-transformers"] || Dir.glob("transformers/**/*.rb").join(" ")
      @organization = parameter_from_issue("Organization", issue_content)
      @project = parameter_from_issue("Project", issue_content)

      @pipeline_type = command.options.fetch("pipeline-type", "pipeline")
      @pipeline_id = command.options["pipeline-id"]
      @target_url = command.options["target-url"]
    end

    def to_a
      args = [@pipeline_type]
      args.concat(["--azure-devops-organization", @organization]) unless @organization.nil?
      args.concat(["--azure-devops-project", @project]) unless @project.nil?
      args.concat(["--custom-transformers", @custom_transformers]) if @custom_transformers.length.positive?
      args.concat(["--pipeline-id", @pipeline_id]) unless @pipeline_id.nil?
      args.concat(["--target-url", @target_url]) unless @target_url.nil?

      return args unless args.empty?
    end
  end
end
