#!/bin/bash

mkdir -p /root/gopath/src /root/gopath/bin /root/gopath/pkg  

echo "Installing tools..."
go get -v golang.org/x/tools/cmd/...

# The following were chosen because they're what vim-go installs if you
# ask it to. They're all pretty helpful to have around.
go get -v github.com/nsf/gocode
go get -v golang.org/x/tools/cmd/goimports
go get -v code.google.com/p/rog-go/exp/cmd/godef
go get -v golang.org/x/tools/cmd/oracle
go get -v golang.org/x/tools/cmd/gorename
go get -v github.com/golang/lint/golint
go get -v github.com/kisielk/errcheck
go get -v github.com/jstemmer/gotags

echo "Installing godep..."
go get -v github.com/tools/godep
