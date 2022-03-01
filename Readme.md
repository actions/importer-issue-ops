# Valet Issue Ops

Valet can be orchestrated using GitHub Actions and Issues. This template repository can be used to enable this workflow to migrate pipelines from an existing CI/CD instance to GitHub Actions.

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
