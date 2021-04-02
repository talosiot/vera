# Vera
> Secrets management
Vera Atkins was a great WWII spy.

## Installation
`./install_requirements`

## Naming conventions

### Github personal access tokens
user@github.com/token
e.g. talosiot-will@github.com/token

### Github deploy keys
git@github.com/(user or org)/(library).git

To see your github deploy keys on github
```bash
gh api repos/:owner/:repo/keys
```
in the repository.

And delete it in aws
```bash
aws secretsmanager list-secrets
aws secretsmanager delete-secret --secret-id git@github.com/...
```

### Grafana api keys

grafana/$url/org/$org_id
e.g. grafana/dashboard.talosiot.com/org/12
