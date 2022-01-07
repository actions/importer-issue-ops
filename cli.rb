# frozen_string_literal: true

require "require_all"
require "pry" if ENV["VALET_CONTAINER"].nil?
require "json"

require_all "lib"
