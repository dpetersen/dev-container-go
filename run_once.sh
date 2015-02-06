#!/bin/bash

mkdir -p /root/gopath/src /root/gopath/bin /root/gopath/pkg  

echo "Installing tools..."
go get golang.org/x/tools/cmd/...

echo "Installing godep..."
go get github.com/tools/godep
