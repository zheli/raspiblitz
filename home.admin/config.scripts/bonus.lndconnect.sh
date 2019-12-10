#!/bin/bash

# commit to checkout
# https://github.com/LN-Zap/lndconnect/commits/master
commit=82d7103bb8c8dd3c8ae8de89e3bc061eef82bb8f

isInstalled=$(lndconnect -h | grep "nocert" -c)
if [ $isInstalled -eq 0 ]; then
  echo "Installing lndconnect.."
  # Install latest lndconnect from source:
  go get -d github.com/LN-Zap/lndconnect
  # locate lndconnect download dir 
  cd /usr/local/gocode/src/github.com/LN-Zap/lndconnect
  git checkout $commit
  make
else
  echo "lndconnect is already installed" 
fi