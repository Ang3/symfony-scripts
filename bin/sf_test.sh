#!/bin/bash
set -uo pipefail

echo
echo -e "\033[43;30;1m---------------------------\033[0m"
echo -e "\033[43;30;1m--- TESTING APPLICATION ---\033[0m"
echo -e "\033[43;30;1m---------------------------\033[0m"
echo

echo
echo -e "\033[33;1mRunning custom test handler\033[0m"
handlerFile=bin/dev/handlers/sf_test.sh
if [ -f "$handlerFile" ]; then
    $handlerFile $@
fi

# shellcheck disable=SC2068
symfony php bin/phpunit $@