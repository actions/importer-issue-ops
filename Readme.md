# Valet Issue Ops

Valet is a tool to help facilitate migrations to GitHub Actions. Valet supports migrating pipelines from Jenkins, Azure DevOps, GitLab CI, Circle CI, and Travis CI to GitHub Actions. This repository provides functionality that wraps the Valet CLI to allow it to be orchestrated through GitHub Actions and Issues.

> Valet is in a private preview and customers must be onboarded prior to using the Valet Issue Ops workflow. Please reach out to [GitHub Sales](https://github.com/enterprise/contact) to enquire about getting into the private preview.

Note: this repository is informally maintained by GitHub. Support can be requested by creating an issue in this repository. We'll be available to provide support Monday through Friday between the hours of 9 AM EST and 5 PM PST.

## Getting started

Complete the following steps:

1. Create a new repository using this repository as the template by clicking [here](https://github.com/valet-customers/issue-ops/generate). 
2. Create the following labels in this new repository: `jenkins`, `azure-devops`, `circle-ci`, `gitlab`, `travis-ci`, and `valet-running`.
3. Add the repository secrets described below that are relevant to the CI/CD providers being migrated:

### All CI/CD providers

The following secrets are required:

- `VALET_GHCR_USERNAME`: The username to access the `valet` container.
- `VALET_GHCR_PASSWORD`: The password to access the `valet` container (requires `read:packages` scope).
- `GH_ACCESS_TOKEN`: GitHub personal access token to create pull requests (requires `repo` and `workflow` scopes).

Optionally, the following environment variables can be set:

- `GITHUB_INSTANCE_URL`: The base URL of your GitHub instance (only required if it is **not** <https://github.com>).

### Azure DevOps

The following secrets are required:

- `AZURE_DEVOPS_ACCESS_TOKEN`: The personal access token to access the Azure DevOps instance. This token requires the following scopes:
  - Build (Read & Execute)
  - Code (Read)
  - Release (Read)
  - Service Connections (Read)
  - Variable Groups (Read)

Optionally, the following environment variables can be set:

- `AZURE_DEVOPS_INSTANCE_URL`: The base URL of your Azure DevOps instance (only required if it is **not** <https://dev.azure.com>).

### Circle CI

The following secrets are required:

- `CIRCLE_CI_ACCESS_TOKEN`: The personal access token to access the Circle CI instance.
- `CIRCLE_CI_SOURCE_GITHUB_ACCESS_TOKEN`: The personal access token to access pipeline files stored in GitHub.

Optionally, the following environment variables can be set:

- `CIRCLE_CI_INSTANCE_URL`: The base URL of your Circle CI instance (only required if it is **not** <https://circleci.com>).

### GitLab CI

The following secrets are required:

- `GITLAB_ACCESS_TOKEN`: The personal access token to access the GitLab CI instance (requires `read_api` scope).

Optionally, the following environment variables can be set:

- `GITLAB_INSTANCE_URL`: The base URL of your GitLab CI instance (only required if it is **not** <https://gitlab.com>).

### Jenkins

The following secrets are required:

- `JENKINSFILE_ACCESS_TOKEN`: The personal access token used to retrieve the contents of a `Jenkinsfile` stored in the build repository (requires `repo` scope).
- `JENKINS_ACCESS_TOKEN`: The access token used to view Jenkins resources.
- `JENKINS_USERNAME`: The username of the user's access token.

The following environment variables are required:

- `JENKINS_INSTANCE_URL`: The base URL of your Jenkins instance.

### Travis CI

The following secrets are required:

- `TRAVIS_CI_ACCESS_TOKEN`: The personal access token to access the Travis CI instance.
- `TRAVIS_CI_SOURCE_GITHUB_ACCESS_TOKEN`: The personal access token to access pipeline files stored in GitHub.

Optionally, the following environment variables can be set:

- `TRAVIS_CI_INSTANCE_URL`: The base URL of your Travis CI instance (only required if it is **not** <https://travis-ci.com>).

## Pipeline migration

Once configured, pipelines can be migrated to GitHub Actions by opening an issue with the relevant issue template and following the instructions.

## Privacy statement

Valet will collect anonymous telemetry when running to help us improve the tool. This can be disable by adding the `--no-telemetry` flag to any command provided to the Valet CLI.

Additionally, by using this repository you agree to GitHub's [Privacy Statement](https://docs.github.com/en/site-policy/privacy-policies/github-privacy-statement#data-retention-and-deletion-of-data) and the [additional terms for Actions](https://docs.github.com/en/site-policy/github-terms/github-terms-for-additional-products-and-features#actions).
