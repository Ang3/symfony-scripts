#!/bin/bash
set -xeuo pipefail

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
  DOCKER_OPTIONS="--remove-orphans"
  if [ "$1" = "reset" ]
  then
    DOCKER_OPTIONS="$DOCKER_OPTIONS --volumes"
  fi
  docker-compose down $DOCKER_OPTIONS
fi