# Vera
> Secrets management

Vera Atkins was a great WWII spy.

## Installation
These scripts depend on the github and aws cli.
`./install_requirements`

## Naming conventions

### Github personal access tokens
user@github.com/token
e.g. talosiot-will@github.com/token

### Github deploy keys
The naming convention is `git@github.com/$owner/$repo.git`.  For example `git@github.com/talosiot/hera.git`.

To see your github deploy keys on github `gh api repos/:owner/:repo/keys` in the repository. 
Then `gh api repos/:owner/:repo/keys/<keyID> --method DELETE`

And to delete it in aws
```bash
aws secretsmanager list-secrets
aws secretsmanager delete-secret --secret-id git@github.com/...
```

### Grafana api keys

The naming convention is `grafana/$url/org/$org_id` for example `grafana/dashboard.talosiot.com/org/12`.  
