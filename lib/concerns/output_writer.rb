# frozen_string_literal: true

module OutputWriter
  def set_output(name, value)
    return if value.nil?

    puts "::set-output name=#{name}::#{value}"
  end
end
