# frozen_string_literal: true

require_relative "../concerns/environment_writer"

class Arguments
  include EnvironmentWriter

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

    # rng = ENV["CI"] ? Random.new(0) : Random.new
    rng = Random.new(0)

    set_output(
      "args",
      arguments.map do |a|
        value = a.include?(" ") ? a.inspect : a
        
        unless value.start_with?("--")
          name = "variable_#{rng.rand(0..1000)}"
          set_environment(name, value)
          
          value = "$#{name}"
        end

        value
      end.join(" ")
    )
  end
end
