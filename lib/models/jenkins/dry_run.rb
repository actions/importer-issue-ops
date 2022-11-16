# frozen_string_literal: true

module Jenkins
  class DryRun
    include IssueParser

    def initialize(_, command)
      @custom_transformers = command.options["custom-transformers"] || Dir.glob("transformers/**/*.rb").join(" ")
      @source_url = command.options["source-url"]
    end

    def to_a
      args = []
      args.concat(["--custom-transformers", @custom_transformers]) if @custom_transformers.length.positive?
      args.concat(["--source-url", @source_url]) unless @source_url.nil?

      return args unless args.empty?
    end
  end
end
