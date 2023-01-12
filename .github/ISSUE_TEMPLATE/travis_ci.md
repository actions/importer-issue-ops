---
name: Travis CI
about: Migrate Travis CI pipelines to GitHub Actions
title: "[Travis CI]:"
labels: travis-ci
assignees: ""
---

## Inputs

Provide the following required inputs:

Organization: _Replace this text  with the Travis CI organization to migrate pipelines from._

## Available commands

The following commands can be executed by adding a comment to this issue:

- `/audit`
- `/dry-run --repository :repository-name`
- `/migrate --repository :repository-name --target-url :github-repository-url`

**Note**: If any options are missing, the command will not be successful.
