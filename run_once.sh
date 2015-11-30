#!/bin/bash

mkdir -p /root/gopath/src /root/gopath/bin /root/gopath/pkg  

echo "Installing tools..."
go get -v golang.org/x/tools/cmd/...

echo "Installing impl..."
go get -v github.com/josharian/impl

# These are helpful dependencies to get vim-go's full functionality, and many
# of them are helpful on their own.
echo "Running vim-go's GoInstallBinaries..."
vim +GoInstallBinaries +qall

echo "Installing pp..."
go get -v github.com/k0kubun/pp

echo "Installing godep..."
go get -v github.com/tools/godep
