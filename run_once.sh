#!/bin/bash

mkdir -p $GOPATH

echo "Installing tools..."
go get -v -u golang.org/x/tools/cmd/...

echo "Installing impl..."
go get -v -u github.com/josharian/impl

echo "Installing protoc-gen-go..."
go get -v -u github.com/golang/protobuf/protoc-gen-go

echo "Installing pp..."
go get -v -u github.com/k0kubun/pp

echo "Installing godep..."
go get -v -u github.com/tools/godep

# These are helpful dependencies to get vim-go's full functionality, and many
# of them are helpful on their own.
echo "Running vim-go's GoInstallBinaries..."
vim +GoInstallBinaries +qall
