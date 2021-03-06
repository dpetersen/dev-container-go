# dev-container-go

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/dpetersen/dev-container-go/)
[![](https://badge.imagelayers.io/dpetersen/dev-container-go.svg)](https://imagelayers.io/?images=dpetersen%2Fdev-container-go:latest,dpetersen%2Fdev-container-base:latest 'Get your own badge on imagelayers.io')

A container, based on [dev-container-base](https://github.com/dpetersen/dev-container-base), for developing in Go.

## Usage

The base container starts an SSH server, so you can read more about that in [its README](https://github.com/dpetersen/dev-container-base). This container assumes that your `GOPATH` will be `/home/dev/gopath`. You'll probably want to volume mount a directory for this, so your changes are easy to get to if you shut down the container.

I usually start it with something like (assuming `$GOPATH` is `~/gopath`):

```bash
docker run -d \
  -e AUTHORIZED_GH_USERS="dpetersen" \
  -p 0.0.0.0:31981:22 \
  -v ~/gopath:/home/dev/gopath \
  dpetersen/dev-container-go:latest
```

There is a bootstrapping script you can run with `/home/dev/run_once.sh` that will bootstrap a `GOPATH` hierarchy and install a few development tools. If you have volume mounted an existing `GOPATH`, this won't smash it.

I'd advise you to set up an SSH alias as [explained here](https://github.com/dpetersen/dev-container-base#connecting).

## Development

Helpful reminders on how to build, tag, and push this can be found in [the Development section](https://github.com/dpetersen/dev-container-base#development) of the other image.
