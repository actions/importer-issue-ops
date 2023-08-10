# frozen_string_literal: true

module Bamboo
  class DryRun
    include IssueParser

    def initialize(issue_content, command)
      @plan_slug = parameter_from_issue("Plan Slug", issue_content)

      @plan_type = command.options.fetch("plan-type", "build")
    end

    def to_a
      args = [@plan_type]
      args.push(["--plan-slug", @plan_slug]) unless @plan_slug.nil?

      return args unless args.empty?
    end
  end
end
