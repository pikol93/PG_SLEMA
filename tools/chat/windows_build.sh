#!/bin/bash

export MSYS_NO_PATHCONV=1

function main() {
    echo frontend
    docker-compose run --rm npm bash /app/build.sh
    echo backend
    cd ../../Chat/; sh ./windows_build.sh
}

main