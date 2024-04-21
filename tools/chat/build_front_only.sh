#!/bin/bash

export MSYS_NO_PATHCONV=1

function main() {
    echo frontend
    docker-compose run --rm ng bash /app/build.sh
}

main