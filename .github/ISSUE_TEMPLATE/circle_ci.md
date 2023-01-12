---
name: CircleCI
about: Migrate CircleCI pipelines to GitHub Actions
title: "[CircleCI]:"
labels: circle-ci
assignees: ""
---

## Inputs

Provide the following required inputs:

Organization: _Replace this text with the CircleCI organization to migrate pipelines from._

## Available commands

The following commands can be executed by adding a comment to this issue:

- `/audit`
- `/dry-run --project :repository-name`
- `/migrate --project :repository-name --target-url :github-repository-url`

**Note**: If any options are missing, the command will not be successful.
