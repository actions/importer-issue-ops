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

    rng = Random.new
    variable_names = Set.new

    set_output(
      "args",
      arguments.map do |a|
        value = a.include?(" ") ? a.inspect : a

        unless value.start_with?("--")
          name = "variable_#{rng.rand(1000..9999)}"
          name = "variable_#{rng.rand(1000..9999)}" while variable_names.include?(name)

          variable_names.add(name)

          set_environment(name, value)

          value = "$#{name}"
        end

        value
      end.join(" ")
    )
  end
end
