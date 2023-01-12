---
name: Azure DevOps
about: Migrate Azure DevOps pipelines to GitHub Actions
title: "[Azure DevOps]:"
labels: azure-devops
assignees: ""
---

## Inputs

Provide the following required inputs:

Organization: _Replace this text with the Azure DevOps organization to migrate pipelines from._
Project: _Replace this text with the Azure DevOps project to migrate pipelines from._

## Available commands

The following commands can be executed by adding a comment to this issue:

- `/audit`
- `/dry-run --pipeline-type pipeline|release --pipeline-id :pipeline-id`
- `/migrate --pipeline-type pipeline|release --pipeline-id :pipeline-id --target-url :github-repository-url`

**Note:** The `pipeline-type` option will default to `pipeline` if omitted. If any remaining options are missing, the command will not be successful.
