# frozen_string_literal: true

require_rel "./azure_devops/**/*.rb"
require_rel "./circle_ci/**/*.rb"
require_rel "./gitlab_ci/**/*.rb"
require_rel "./jenkins/**/*.rb"
require_rel "./travis_ci/**/*.rb"

class Provider
  include EnvironmentWriter

  PROVIDER_MAP = {
    "azure-devops" => ::AzureDevops,
    "bamboo"       => ::Bamboo,
    "bitbucket"    => ::Bitbucket,
    "circle-ci"    => ::CircleCI,
    "gitlab"       => ::GitlabCI,
    "jenkins"      => ::Jenkins,
    "travis-ci"    => ::TravisCI
  }.freeze

  def initialize(labels)
    providers = JSON.parse(labels).select { |label| PROVIDER_MAP.key?(label) }

    raise "One provider must be selected" if providers.empty?
    raise "Only one provider can be selected" unless providers.one?

    @provider = providers.first
  end

  def cli_command
    @provider
  end

  def module
    PROVIDER_MAP[@provider]
  end

  def to_output
    set_output("provider", cli_command)
  end
end
