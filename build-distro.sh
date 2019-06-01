#!/bin/bash

cp cpp/program.cpp ${1}
cp container-scripts/install-n-test.sh ${1}

docker build -t ${1}-splashkit ${1}

rm ${1}/program.cpp ${1}/install-n-test.sh
