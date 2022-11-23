# frozen_string_literal: true

require_relative "../concerns/output_writer"

class Arguments
  include OutputWriter

  def initialize(provider, command, issue_content)
    @args = argument_class(provider, command, issue_content)
    @custom_transformers = custom_transformers(command)
  end

  def argument_class(provider, command, issue_content)
    provider.module.const_get(command.classify).new(issue_content, command)
  end

  def custom_transformers(command)
    command.options&.dig("custom-transformers")&.split(" ") || Dir.glob("transformers/**/*.rb")
  end

  def to_output
    arguments = @args.to_a
    return if arguments.blank?

    arguments.concat(["--custom-transformers", *@custom_transformers]) if @custom_transformers.length.positive?

    set_output(
      "args",
      arguments.map do |a|
        next a unless a.include?(" ")

        a.inspect
      end.join(" ")
    )
  end
end
