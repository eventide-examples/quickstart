#!/usr/bin/env bash

set -e

echo
echo "Installing gems to ./gems"
echo '= = ='

cmd="bundle install --standalone --path=./gems"

echo $cmd
($cmd)

echo '- - -'
echo '(done)'
echo
