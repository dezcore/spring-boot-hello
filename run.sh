#!/bin/bash

fonctiondetest() {
   echo "Hello world !" $1
}

clean() {
    docker compose down -v
}

run() {
    clean
    docker build -t springbootdocker . --target dev
    docker compose up
}

if [[ "$1" == "default" ]];then
fonctiondetest
elif [[ "$1" == "run" ]];then
run
elif [[ "$1" == "clean" ]];then
clean
fi
#run