# frozen_string_literal: true

module AzureDevops
  class DryRun
    include IssueParser

    def initialize(issue_content, command)
      @organization = parameter_from_issue("Organization", issue_content)
      @project = parameter_from_issue("Project", issue_content)

      @pipeline_type = command.options.fetch("pipeline-type", "pipeline")
      @pipeline_id = command.options["pipeline-id"]
    end

    def to_a
      args = [@pipeline_type]
      args.push(["--azure-devops-organization", @organization]) unless @organization.nil?
      args.push(["--azure-devops-project", @project]) unless @project.nil?
      args.push(["--pipeline-id", @pipeline_id]) unless @pipeline_id.nil?

      return args unless args.empty?
    end
  end
end
