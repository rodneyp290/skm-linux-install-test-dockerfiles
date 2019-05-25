# Linux SplashKit Test Dockerfiles

This repository has a collection of Dockerfile for testing the SplashKit's
`skm linux install`.

## How to test them

NOTE: the below instructions assumes you have a X Server running on the host.
      Windows - [Xming](https://sourceforge.net/projects/xming/).
      Mac OS  - [XQuartz](https://www.xquartz.org/).


1. run `./build-distro.sh <distro-docker-dir>` (eg. `./build-distro.sh debian`)
2. run `./run-distro.sh <distro-docker-dir>` (eg. `./build-distro.sh debian`)
3. find out the container's IP address (mine usually `172.17.0.2`, when it is the
   only container is running)
4. ssh (X11 forwarding) in with `ssh -Y splashkit@<ip-address>`, using the
   password `kit`
5. run `./install-n-test.sh` following will happen
  - `skm linux install` will run and you will need to respond to prompts
  - `skm g++ -o g++-program program.cpp` will compile program.cpp with g++
	- if successful the resulting g++-program will be run, and white splashkit
	  window should pop up
  - `skm clang++ -o clang++-program program.cpp` will compile program.cpp with clang++
	- if successful the resulting clang++-program will be run, and white splashkit
	  window should pop up
