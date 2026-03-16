#! /bin/sh
go install golang.org/x/tools/gopls@latest
# go get -u github.com/cweill/gotests/...
go install github.com/fatih/gomodifytags@latest
go install github.com/josharian/impl@latest
go install github.com/go-delve/delve/cmd/dlv@latest
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/HEAD/install.sh | sh -s -- -b $(go env GOPATH)/bin v2.1.6
