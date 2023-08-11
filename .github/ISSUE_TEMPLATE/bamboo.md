---
name: Bamboo
about: Migrate Bamboo pipelines to GitHub Actions
title: "[Bamboo]:"
labels: bamboo
assignees: ""
---

## Inputs

Plan Slug: _Replace this text with the Bamboo plan slug (e.g. PAN-SLUG) to migrate pipelines from._

## Available commands

The following commands can be executed by adding a comment to this issue:

- `/audit`
- `/dry-run --plan-type build|deployment`
- `/migrate --plan-type build|deployment --target-url :github-repository-url`

**Note:** The `plan-type` option will default to `build` if omitted. If any remaining options are missing, the command will not be successful.
