#!/bin/bash

export MSYS_NO_PATHCONV=1

function main() {
    docker-compose build
    echo frontend
    docker-compose run --rm npm bash /app/build.sh
    echo backend
    cd ../../Chat/; sh ./windows_build.sh
}

main