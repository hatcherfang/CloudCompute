#!/bin/bash

cwd="$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)"
PWD=$(dirname $cwd)
start(){
    docker start nginx 
}

stop(){
    docker stop nginx 
}

restart(){
    stop
    sleep 1
    start
}

build(){
    stop
    docker rm nginx
    docker build -t nginx_server $PWD
    docker run --name nginx -d -p 8443:8443 nginx_server
}

case "$1" in 
    'start')
        start
        ;;
    'stop')
        stop
        ;;
    'restart')
        restart
        ;;
    'build')
        build
        ;;
    *)
        echo "usage: $0 start|stop|restart|build"
        exit 1
        ;;
esac
