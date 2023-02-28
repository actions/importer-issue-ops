# frozen_string_literal: true

module OutputWriter
  def set_output(name, value)
    return if value.nil?

    File.open(ENV["GITHUB_OUTPUT"], "a") do |f|
      f.puts "#{name}=#{value}"
    end
  end
end
