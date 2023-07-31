# frozen_string_literal: true

module Jenkins
  class Audit
    include IssueParser

    def initialize(issue_content, _)
      @folders = parameter_from_issue("Folders", issue_content)
    end

    def to_a
      return if @folders.nil?

      [["--folders", @folders]]
    end
  end
end
