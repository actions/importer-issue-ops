# frozen_string_literal: true

module IssueParser
  def parameter_from_issue(name, text)
    match = text.match(/#{name}: ([^\n]+)/)
    return if match.nil?

    match[1].strip
  end
end
