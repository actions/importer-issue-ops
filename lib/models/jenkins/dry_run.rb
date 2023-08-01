# frozen_string_literal: true

module Jenkins
  class DryRun
    include IssueParser

    def initialize(_, command)
      @source_url = command.options["source-url"]
    end

    def to_a
      return if @source_url.nil?

      [["--source-url", @source_url]]
    end
  end
end
