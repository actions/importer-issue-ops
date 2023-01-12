---
name: Jenkins
about: Migrate Jenkins jobs to GitHub Actions
title: "[Jenkins]:"
labels: jenkins
assignees: ""
---

## Inputs

Provide the following optional inputs:

Folders: _Include specific folders in an audit (delete if not applicable)_

## Available commands

The following commands can be executed by adding a comment to this issue:

- `/audit`
- `/dry-run --source-url :jenkins-job-url`
- `/migrate --source-url :jenkins-job-url --target-url :github-repository-url`

**Note**: If any options are missing, the command will not be successful.
