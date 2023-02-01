#!/bin/bash
set -uo pipefail

MODE=${1:-normal}

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
  if [ "$MODE" = "reset" ]
  then
    DOCKER_OPTIONS="$DOCKER_OPTIONS --volumes"
  fi
  docker-compose down $DOCKER_OPTIONS
fi

echo
echo -e "\033[33;1mRunning custom handlers\033[0m"
handlerFile=bin/dev/handlers/sf_stop.sh
if [ -f "$handlerFile" ]; then
    $handlerFile $@
fi