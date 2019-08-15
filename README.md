# PROTOC GENERATOR

## Overview

Proto Generator GRPC static code generation tool that uses a Docker container to compile your GRPC `.proto` files to your preferred language so you don't have to install the compilers on your local machine. It currently only compiles to NodeJS.

## System Requirements

1. Docker
2. NodeJS and NPM

## Usage

1. Clone the repository `git clone https://github.com/buchanora/grpc-proto-generator.git` then:
2. `cd <path-to-repo`.
3. `npm run build`.
4. `mkdir protos`.
5. Add `<serviceName>.proto` files to `protos` directory.
6. Run `PROTO_FILE=<serviceName>.proto npm run compile`.

Compiled files appear under the `compiled/<language>` directory.

##TODO

1. Configure compilers for Go, C#, Python, PHP, Objective-c, ruby
