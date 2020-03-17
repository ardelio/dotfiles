#!/usr/bin/env bash

DIRECTORIES=""

for directory in $DIRECTORIES; do
  echo """Creating directory: $directory"""
  mkdir -p $directory
done

