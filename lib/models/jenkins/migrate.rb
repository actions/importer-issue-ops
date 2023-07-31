# frozen_string_literal: true

module Jenkins
  class Migrate
    include IssueParser

    def initialize(_, command)
      @source_url = command.options["source-url"]
      @target_url = command.options["target-url"]
    end

    def to_a
      args = []
      args.push(["--source-url", @source_url]) unless @source_url.nil?
      args.push(["--target-url", @target_url]) unless @target_url.nil?

      return args unless args.empty?
    end
  end
end
