---
name: GitLab
about: Migrate GitLab pipelines to GitHub Actions
title: "[GitLab]:"
labels: gitlab
assignees: ""
---

## Inputs

Provide the following **required** inputs:

Namespace: _Replace this text with the GitLab namespace (or group) to migrate pipelines from._

## Available commands

The following commands can be executed by adding a comment to this issue:

- `/audit`
- `/dry-run --project :project-name`
- `/migrate --project :project-name --target-url :github-repository-url`

**Note**: If any options are missing, the command will not be successful.
