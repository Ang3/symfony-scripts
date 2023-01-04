#!/bin/bash

echo
echo -e "\033[33;1m--- STOPPING APPLICATION ---\033[0m"

echo
echo -e "\033[33;1mStopping web server\033[0m"
symfony server:stop

# shellcheck disable=SC2166
if [ -f "docker-compose.yml" -o -f "docker-compose.yaml" ]
then
  echo
  echo -e "\033[33;1mStopping Docker containers\033[0m"
  if [ -z "$1" ]
  then
    if [ "$1" = "reset" ]
    then
      docker-compose down --volumes --remove-orphans
    else
      docker-compose down
    fi
  fi
fi