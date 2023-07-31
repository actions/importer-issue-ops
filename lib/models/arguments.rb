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
    arguments = @args.to_a || []
    arguments.push(["--custom-transformers", *@custom_transformers]) if @custom_transformers.length.positive?

    return if arguments.blank?

    rng = Random.new
    variable_names = Set.new

    set_output(
      "args",
      arguments.map do |value|
        unless value.is_a?(Array)
          value = value.inspect if value.include?(" ")

          next value
        end

        value.map.with_index do |v, index|
          v = v.inspect if v.include?(" ")

          next v if index.zero?

          name = "variable_#{rng.rand(1000..9999)}"
          name = "variable_#{rng.rand(1000..9999)}" while variable_names.include?(name)

          variable_names.add(name)

          set_environment(name, v)

          "$#{name}"
        end
      end.join(" ")
    )
  end
end
