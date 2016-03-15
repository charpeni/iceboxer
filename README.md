## ICEBOXER

ICEBOXER systemizes a hard decision - when is a valid issue not important enough to be fixed? 

To be productive, we must default to no.  Issues should be considered irrelevant until they've been brought up many times.  Open issue count in aggregate should not affect prioritization when the open issues themselves are of little impact.

So let's close some issues.

ICEBOXER finds:
- issues older than a year, with no updates in last 2 months
- issues not touched in the last 6 months

To those issues, ICEBOXER:
- adds a comment
- tags the issue with the label 'Icebox'
- closes the issue

How to use it:

- Go to https://github.com/settings/tokens/new, generate a token and copy it to clipboard
- Set an env variable: `export ICEBOXER_GITHUB_API_TOKEN=YOUR_TOKEN`
- Set an env variable: `export ICEBOXER_REPOS=your_org/your_repo`

```
bundle install
rake icebox
```
