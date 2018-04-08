# Pre-work

ETCD3 installed.
this endpoint is `http://192.168.20.202:2379`

set basic-data before start up 
```
    ETCDCTL_API=3 ./etcdctl --endpoints http://192.168.20.202:2379 put /servers/myapp/domain/my-app
    ETCDCTL_API=3 ./etcdctl --endpoints http://192.168.20.202:2379 put /servers/myapp/upstream/default 127.0.0.1:80
    ETCDCTL_API=3 ./etcdctl --endpoints http://192.168.20.202:2379 put /servers/myapp/upstream/app1 192.168.1.101
    ETCDCTL_API=3 ./etcdctl --endpoints http://192.168.20.202:2379 put /servers/myapp/upstream/app2 192.168.1.102
    ETCDCTL_API=3 ./etcdctl --endpoints http://192.168.20.202:2379 put /servers/myapp/upstream/app3 192.168.1.103

```

# Introduction
A minimal Docker image based on Alpine Linux with Nginx
which is dynamically configured using ConfD.

This is a basic example of how to use confd with Docker environment variables
to set run-time configuration for containers.

# Quick Start Guide
`docker-compose up`

Browse to http://localhost:3000/



