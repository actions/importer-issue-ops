# frozen_string_literal: true

module EnvironmentWriter
  def set_output(name, value)
    modify_env("GITHUB_OUTPUT", name, value)
  end

  def set_environment(name, value)
    modify_env("GITHUB_ENV", name, value)
  end

  private

  def modify_env(file, name, value)
    return if value.nil?

    raise ArgumentError, "Invalid input: #{name}=#{value}" if value.include?("\n")

    File.open(ENV[file], "a") do |f|
      f.puts "#{name}=#{value}"
    end
  end
end
