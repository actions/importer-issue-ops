# GitHub Actions Importer IssueOps

The GitHub Actions Importer IssueOps repository demonstrates the functionality necessary to run GitHub Actions Importer commands through Actions and Issues, allowing you to migrate your CI/CD workflows without needing to install software on your local machine. This approach is especially useful for organizations that want to enable self-service migrations to GitHub Actions.

[GitHub Actions Importer](https://docs.github.com/en/actions/migrating-to-github-actions/automating-migration-with-github-actions-importer) helps plan, forecast, and automate the migration of Azure DevOps, CircleCI, GitLab, Jenkins, and Travis CI pipelines to GitHub Actions. GitHub Actions Importer is distributed as a CLI and offers various commands you can use to migrate pipelines:

- `audit`: An audit will fetch all the pipelines defined in an existing CI server, convert each pipeline to its equivalent in GitHub Actions, and write a report that summarizes how complete of a migration the GitHub Actions Importer can provide.
- `dry-run`: A dry run will fetch a single pipeline definition, convert it to its equivalent in GitHub Actions, and write a file (or files) to disk containing the converted workflow.
- `migrate`: A migration will fetch a single pipeline definition, convert it to its equivalent in GitHub Actions, and open a pull request to a repository with the converted workflow.

> **Note**: GitHub Actions Importer is currently available as a public preview. Visit the [sign up page](https://github.com/features/actions-importer/signup) to request access to the preview.

## Getting started

Complete the following steps:

1. Create a new repository using this repository as the template by clicking [here](https://github.com/actions/importer-issue-ops/generate). 
2. Create the following labels in this new repository: `jenkins`, `azure-devops`, `circle-ci`, `gitlab`, `travis-ci`, and `actions-importer-running`.
3. Add the repository secrets described below that are relevant to the CI/CD providers being migrated:

### All CI/CD providers

The following secrets are required:

- `GHCR_USERNAME`: The username to access the GitHub Actions Importer container.
- `GHCR_PASSWORD`: The password to access the GitHub Actions Importer container (requires `read:packages` scope).
- `GH_ACCESS_TOKEN`: GitHub personal access token to create pull requests (requires `repo` and `workflow` scopes).

Optionally, the following environment variables can be set:

- `GITHUB_INSTANCE_URL`: The base URL of your GitHub instance (only required if it is **not** <https://github.com>).

### Azure DevOps

The following secrets are required:

- `AZURE_DEVOPS_ACCESS_TOKEN`: The personal access token to access the Azure DevOps instance. This token requires the following scopes:
  - Build (Read)
  - Agent Pools (Read)
  - Code (Read)
  - Release (Read)
  - Service Connections (Read)
  - Task Groups (Read)
  - Variable Groups (Read)

Optionally, the following environment variables can be set:

- `AZURE_DEVOPS_INSTANCE_URL`: The base URL of your Azure DevOps instance (only required if it is **not** <https://dev.azure.com>).

### CircleCI

The following secrets are required:

- `CIRCLE_CI_ACCESS_TOKEN`: The personal access token to access the CircleCI instance.
- `CIRCLE_CI_SOURCE_GITHUB_ACCESS_TOKEN`: The personal access token to access pipeline files stored in GitHub.

Optionally, the following environment variables can be set:

- `CIRCLE_CI_INSTANCE_URL`: The base URL of your CircleCI instance (only required if it is **not** <https://circleci.com>).

### GitLab

The following secrets are required:

- `GITLAB_ACCESS_TOKEN`: The personal access token to access the GitLab instance (requires `read_api` scope).

Optionally, the following environment variables can be set:

- `GITLAB_INSTANCE_URL`: The base URL of your GitLab instance (only required if it is **not** <https://gitlab.com>).

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

GitHub Actions Importer will collect anonymous telemetry when running to help us improve the tool. This can be disabled by adding the `--no-telemetry` flag to any command provided to the GitHub Actions Importer CLI.

Additionally, by using this repository you agree to GitHub's [Privacy Statement](https://docs.github.com/en/site-policy/privacy-policies/github-privacy-statement#data-retention-and-deletion-of-data) and the [additional terms for Actions](https://docs.github.com/en/site-policy/github-terms/github-terms-for-additional-products-and-features#actions).
