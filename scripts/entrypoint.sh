#!/bin/bash
mkdir -p ../compiled/js
grpc_tools_node_protoc --js_out=import_style=commonjs,binary:../compiled/js --grpc_out=../compiled/js --plugin=protoc-gen-grpc="$USER_HOME"/.npm-global/lib/node_modules/grpc-tools/bin/grpc_node_plugin "$PROTO_FILE"