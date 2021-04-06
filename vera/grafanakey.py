# AUTOGENERATED! DO NOT EDIT! File to edit: nbs/grafanakey.ipynb (unless otherwise specified).

__all__ = ['name', 'create', 'update', 'get', 'delete']

# Cell
import vera.secret as secret


# Cell

def name(host, org):
    '''
    host is the grafana host.  e.g. dashboard.talosiot.com
    org is the organization number. e.g. 7
    '''
    return "grafana/{h}/org/{org}".format(h=host, org=org)

def create(host, org, key, **kwargs):
    value = key
    keyname = name(host, org)
    return secret.create(name=keyname, value=value, **kwargs)

def update(host, org, key, **kwargs):
    value = key
    keyname = name(host, org)
    return secret.update(name=keyname, value=value, **kwargs)

def get(host, org, **kwargs):
    keyname = name(host, org)
    return secret.get(name=keyname, **kwargs)

def delete(host, org, **kwargs):
    keyname = name(host, org)
    return secret.delete(name=keyname, **kwargs)
