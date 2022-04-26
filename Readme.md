# Valet Issue Ops

The Valet IssueOps template repository provides the functionality necessary to run Valet commands through GitHub Actions and Issues, allowing you to migrate your CI/CD workflows without needing to install software on your local machine. This approach is especially useful for organizations that want to enable self-service migrations to GitHub Actions.

Valet helps facilitate the migration of Azure DevOps, Circle CI, GitLab CI, Jenkins, and Travis CI pipelines to GitHub Actions. Valet is distributed as a CLI and offers three commands you can use to migrate pipelines:

- `audit`: An audit will fetch all the pipelines defined in an existing CI server, convert each pipeline to its equivalent in GitHub Actions, and write a report that summarizes how complete of a migration Valet can provide.
- `dry-run`: A dry run will fetch a single pipeline definition, convert it to its equivalent in GitHub Actions, and write a file (or files) to disk containing the converted workflow.
- `migrate`: A migration will fetch a single pipeline definition, convert it to its equivalent in GitHub Actions, and open a pull request to a repository with the converted workflow.

> Because Valet is in private preview, customers must be onboarded prior to using the Valet IssueOps workflow. Please reach out to GitHub Sales to inquire about being added to the private preview.

**Note**: You can request support by using [this](https://github.com/valet-customers/issue-ops/issues/new?assignees=&labels=support&template=support.md&title=) template to create an issue. The Valet team responds to support requests Monday through Friday between the hours of 9AM EST and 5PM PST.

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

Valet will collect anonymous telemetry when running to help us improve the tool. This can be disabled by adding the `--no-telemetry` flag to any command provided to the Valet CLI.

Additionally, by using this repository you agree to GitHub's [Privacy Statement](https://docs.github.com/en/site-policy/privacy-policies/github-privacy-statement#data-retention-and-deletion-of-data) and the [additional terms for Actions](https://docs.github.com/en/site-policy/github-terms/github-terms-for-additional-products-and-features#actions).
