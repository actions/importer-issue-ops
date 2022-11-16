# Custom Transformers

This `./transformers` directory can be used to store `.rb` files which will be used during `dry-run` and `migrate` commands to override GitHub Action Importer's default behavior and customize the converted workflow using "custom transformers". Custom transformers can be used to:

- Convert items that are not automatically converted.
- Convert items that were automatically converted using different actions.
- Convert environment variable values differently.
- Convert references to runners to use a different runner name in Actions.

**ALL** .rb files located under the ./transformers path will be used during `dry-run` and `migrate` commands.  Passing `--custom-transformers path/to/transformer.rb` during issue comment will overwrite this behavior and allow for a specified file to be called.

## Example Transformers

The following are example references which can be used as custom transformers:

```ruby
# Overwrite the runners from the source pipeline
runner "TeamARunner", "ubuntu-latest"

# Overwrite Environment variable `DB_ENGINE` from the source pipeline
env "DB_ENGINE", "mongodb"

# Overwrite the `sleep` step behavior from the source pipeline using the passed key values
transform "sleep" do |item|
    wait_time = item["arguments"][0]["value"]["value"]

    {
      "name": "Sleep for #{wait_time} seconds",
      "run": "sleep #{wait_time}s",
      "shell": "bash"
    }
end
```
