# frozen_string_literal: true

module Jenkins
  class DryRun
    include IssueParser

    def initialize(_, command)
      @custom_transformers = command.options["custom-transformers"]
      @source_url = command.options["source-url"]
    end

    def to_a
      args = []
      args.concat(["--custom-transformers", @custom_transformers]) unless @custom_transformers.nil?
      args.concat(["--source-url", @source_url]) unless @source_url.nil?

      return args unless args.empty?
    end
  end
end
