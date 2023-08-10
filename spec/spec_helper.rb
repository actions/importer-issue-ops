# frozen_string_literal: true

require "bundler/setup"
require "factory_bot"
require "faker"
require "fileutils"

require_relative "../cli"

Dir[File.join(__dir__, "support/**/*.rb")].sort.each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    # Override truncation of expected/got output
    c.max_formatted_output_length = 1000
    c.syntax = :expect
  end

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
    Dir.mkdir("tmp") unless Dir.exist?("tmp")
    FileUtils.touch "tmp/test.txt"
    ENV["GITHUB_OUTPUT"] = "tmp/test.txt"
    ENV["GITHUB_ENV"] = "tmp/test.txt"
  end

  config.after(:suite) do
    File.delete("tmp/test.txt")
  end
end
