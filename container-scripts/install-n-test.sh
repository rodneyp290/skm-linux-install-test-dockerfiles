#!/bin/bash
skm linux install

echo Testing SplashKit g++ compile
if (skm g++ -o g++-program program.cpp); then
  echo SplashKit g++ compiling works!
  echo Testing running g++ compiled program
  if (./g++-program); then
	echo skm g++ runtime works!
  else
	echo Something is wrong with the SplashKit g++ runtime
  fi
else
  echo Something is wrong with the SplashKit g++ runtime
fi


echo Testing SplashKit clang++ compile
if (skm clang++ -o clang++-program program.cpp); then
  echo SplashKit clang++ compiling works!
  echo Testing running clang++ compiled program
  if (./clang++-program); then
	echo skm clang++ runtime works!
  else
	echo Something is wrong with the SplashKit clang++ runtime
  fi
else
  echo Something is wrong with the SplashKit clang++ runtime
fi

