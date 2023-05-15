# frozen_string_literal: true

require "active_support/core_ext/string"
require_relative "../concerns/environment_writer"

class Command
  include EnvironmentWriter

  VALID_COMMANDS = %w[audit migrate dry-run].freeze

  def initialize(comment_body)
    @comment_body = comment_body
  end

  def command
    @command ||= begin
      command = @comment_body&.match(%r{/([^\s\\]+)})
      command[1] unless command.nil? || !VALID_COMMANDS.include?(command[1])
    end
  end

  def valid?
    !command.nil?
  end

  def classify
    return unless valid?

    command.tr("-", "_").classify
  end

  def options
    return unless valid?

    @options ||= begin
      command_text = "/#{command}"
      command_index = @comment_body.index(command_text)

      options_text = @comment_body[command_index + command_text.length..-1]
      options_text.split(" ")
                  .each_slice(2)
                  .to_h
                  .transform_keys { |key| key.delete_prefix("--") }
    end
  end

  def to_output
    set_output("command", command)
  end
end
