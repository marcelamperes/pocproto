# B2Beauty APIs

This repository contains the original interface definitions for a
small (but growing) set of B2Beauty APIs.

## Overview

There are two ways of accessing B2Beauty APIs:

1. Protocol Buffers over gRPC: You can access B2Beauty APIs published
in this repository through [GRPC](https://github.com/grpc), which is
a high-performance binary RPC protocol over HTTP/2. It offers many
useful features, including request/response multiplex and full-duplex
streaming.

## Generate gRPC Source Code

To generate gRPC source code for B2Beauty APIs in this repository, you
use [znly's container](https://github.com/znly/docker-protobuf).

## Reference implementation
[Google APIs](https://github.com/googleapis/googleapis)

### Samples

```bash
# for ruby
docker run --rm -v $(pwd):$(pwd) -w $(pwd) -e "LANGUAGE=ruby" --entrypoint="./build.sh" znly/protoc

# for java
docker run --rm -v $(pwd):$(pwd) -w $(pwd) -e "LANGUAGE=java" --entrypoint="./build.sh" znly/protoc

# for objc
docker run --rm -v $(pwd):$(pwd) -w $(pwd) -e "LANGUAGE=objc" --entrypoint="./build.sh" znly/protoc

# for python
docker run --rm -v $(pwd):$(pwd) -w $(pwd) -e "LANGUAGE=python" --entrypoint="./build.sh" znly/protoc

# for csharp
docker run --rm -v $(pwd):$(pwd) -w $(pwd) -e "LANGUAGE=csharp" --entrypoint="./build.sh" znly/protoc

# for go
docker run --rm -v $(pwd):$(pwd) -w $(pwd) -e "LANGUAGE=go" --entrypoint="./build.sh" znly/protoc
```
