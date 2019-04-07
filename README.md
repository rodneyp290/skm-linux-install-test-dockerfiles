# Linux SplashKit Test Dockerfiles

This repository has a collection of Dockerfile for testing the SplashKit's
`skm linux install`.

## How to test them

NOTE: the below instructions assumes you have a X Server running on the host.
      Windows - [Xming](https://sourceforge.net/projects/xming/)
      Mac OS  - [XQuartz](https://www.xquartz.org/)

**TODO: Rewrite so it is clearer**
1. `cd` into the relevant distro directory
2. build the `docker build -t <distro>-SplashKit .`
3. run a contain base on the resulting image with
   `docker run -it <distro>-SplashKit`
4. find out the contain IP address (mine usually `172.17.0.2`, when it is the
   only container is running)
5. ssh (X11 forwarding) in with `ssh -Y splashkit@<ip-address>`, using the
   password `skm`
6. run `skm linux install`
7. make a new C++ SplashKit project and cd into it, with the following commands
```
mkdir cpp
cd cpp
skm new c++
```
8. rewrite the `program.cpp` file to open a splashkit window for a couple
   seconds, as shown below:
```
#include "splashkit.h"

int main()
{
    open_window("SplashKit", 640, 480);
    delay(2000);
    return 0;
}
```
9. test compiling with g++/clang using:
```
skm g++ program.cpp
skm clang++ program.cpp
```
10. assuming one was successful run the program with `./a.out`
    you should see a plain white window pop up
