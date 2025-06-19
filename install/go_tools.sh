#! /bin/sh
wget https://go.dev/dl/go1.24.4.linux-amd64.tar.gz
sudo tar -C /usr/local/ -xzf go1.24.4.linux-amd64.tar.gz

/usr/local/go/bin/go install golang.org/x/tools/gopls@latest
# /usr/local/go/bin/go get -u github.com/cweill/gotests/...
/usr/local/go/bin/go install github.com/fatih/gomodifytags@latest
/usr/local/go/bin/go install github.com/josharian/impl@latest
/usr/local/go/bin/go install github.com/go-delve/delve/cmd/dlv@latest
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/HEAD/install.sh | sh -s -- -b $(go env GOPATH)/bin v2.1.6
