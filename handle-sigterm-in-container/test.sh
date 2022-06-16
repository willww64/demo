#!/usr/bin/env bash

set -euo pipefail

docker build -t handle-sigterm .

for i in true false; do
    name=handle-sigterm-$i
    docker run -d --name $name -e HANDLE_SIGTERM=$i handle-sigterm
    sleep 1
    time docker stop $name
    docker rm $name
done

docker rmi handle-sigterm
