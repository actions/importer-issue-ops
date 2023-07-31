# frozen_string_literal: true

module AzureDevops
  class Audit
    include IssueParser

    def initialize(issue_content, _)
      @organization = parameter_from_issue("Organization", issue_content)
      @project = parameter_from_issue("Project", issue_content)
    end

    def to_a
      args = []
      args.push(["--azure-devops-organization", @organization]) unless @organization.nil?
      args.push(["--azure-devops-project", @project]) unless @project.nil?

      return args unless args.empty?
    end
  end
end
