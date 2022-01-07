---
name: Circle CI
about: Migrate Circle CI pipelines to GitHub Actions with Valet
title: "[Circle CI]:"
labels: circle-ci
assignees: ""
---

## Inputs

Provide the following required inputs:

Organization:
_The Circle CI organization to migrate pipelines from._

## Available commands

The following commands can be executed by adding a comment to this issue:

- `/audit`
- `/dry-run --repository :repository-name`
- `/migrate --repository :repository-name --target-url :github-repository-url`

**Note**: If any options are missing, the command will not be successful.
