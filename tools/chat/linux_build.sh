#!/bin/bash

export MSYS_NO_PATHCONV=1

function main() {
    docker-compose build
    echo frontend
    docker-compose run --rm ng bash /app/build.sh
    echo backend
    cd ../../Chat/; sh ./linux_build.sh
}

main