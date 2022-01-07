---
name: GitLab CI
about: Migrate GitLab CI pipelines to GitHub Actions with Valet
title: "[GitLab CI]:"
labels: gitlab
assignees: ""
---

## Inputs

Provide the following required inputs:

Namespace:
_The GitLab CI namespace (or group) to migrate pipelines from._

## Available commands

The following commands can be executed by adding a comment to this issue:

- `/audit`
- `/dry-run --project :project-name`
- `/migrate --project :project-name --target-url :github-repository-url`

**Note**: If any options are missing, the command will not be successful.
