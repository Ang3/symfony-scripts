#!/bin/bash
set -uo pipefail

MODE=${1:-normal}

echo
echo -e "\033[33;1m--- STARTING APPLICATION ---\033[0m"

# shellcheck disable=SC2166
if [ -f "docker-compose.yml" -o -f "docker-compose.yaml" ]
then
  echo
  echo -e "\033[33;1mStarting Docker containers\033[0m"
  docker-compose up -d
  sleep 3
fi

echo
echo -e "\033[33;1mComposer installation\033[0m"
composer install
composer require tests --dev

isDoctrineInstalled=$(cat config/bundles.php | grep -c "DoctrineBundle::class")

if [ $isDoctrineInstalled -gt 0 ]
then
  echo
  echo -e "\033[33;1mInstalling Doctrine development dependencies\033[0m"
  composer require orm-fixtures zenstruck/foundry --dev

  if [ "$MODE" = "reset" ]
  then
    echo -e "\033[33;1mReinitializing doctrine migrations files\033[0m"
    rm -rf migrations/Version*.php
    symfony console doctrine:migrations:diff
  fi

  echo
  echo -e "\033[33;1mMigrating database\033[0m"
  symfony console doctrine:migrations:migrate --no-interaction

  echo
  echo -e "\033[33;1mRegistering fixtures\033[0m"
  symfony console doctrine:fixtures:load --no-interaction
fi

if [ "$MODE" = "reset" ]
then
  echo
  echo -e "\033[33;1mDeleting cache and logs\033[0m"
  rm -rf var/cache
  rm -rf var/log

  echo
  echo -e "\033[33;1mRunning custom handlers\033[0m"
  handlerResetFile=bin/dev/handlers/sf_reset.sh
  if [ -f "$handlerResetFile" ]; then
      $handlerResetFile $@
  fi
fi

isWebpackInstalled=$(cat config/bundles.php | grep -c "WebpackEncoreBundle::class")

if [ $isWebpackInstalled -gt 0 ]
then
  echo
  echo -e "\033[33;1mInstalling NodeJS dependencies\033[0m"
  yarn install --force

  echo
  echo -e "\033[33;1mCompiling assets\033[0m"
  yarn encore dev
fi

echo
echo -e "\033[33;1mRunning custom handlers\033[0m"
handlerFile=bin/dev/handlers/sf_start.sh
if [ -f "$handlerFile" ]; then
    $handlerFile $@
fi

echo
echo -e "\033[33;1mStarting web server\033[0m"
symfony server:start -d