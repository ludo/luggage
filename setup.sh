#!/bin/bash

# Link dotfiles
for file in ~/baggage/dotfiles/*
do
  echo "$file"
  # ln -s -e "s/<<filename>>/$a/g" $a $a.ctl
done