# frozen_string_literal: true

module Jenkins
  class Migrate
    include IssueParser

    def initialize(_, command)
      @custom_transformers = command.options["custom-transformers"] || Dir.glob("transformers/**/*.rb").join(" ")
      @source_url = command.options["source-url"]
      @target_url = command.options["target-url"]
    end

    def to_a
      args = []
      args.concat(["--custom-transformers", @custom_transformers]) if @custom_transformers.length.positive?
      args.concat(["--source-url", @source_url]) unless @source_url.nil?
      args.concat(["--target-url", @target_url]) unless @target_url.nil?

      return args unless args.empty?
    end
  end
end
