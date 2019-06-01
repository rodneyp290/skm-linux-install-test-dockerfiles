#!/bin/bash
if (docker ps -a | grep splashkit-${1} > /dev/null ); then
  docker start splashkit-${1}
else
  docker run --name splashkit-${1} ${1}-splashkit
fi
