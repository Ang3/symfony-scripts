#!/bin/bash
set -xeuo pipefail

echo
echo -e "\033[43;30;1m---------------------------\033[0m"
echo -e "\033[43;30;1m--- TESTING APPLICATION ---\033[0m"
echo -e "\033[43;30;1m---------------------------\033[0m"
echo

echo
echo -e "\033[33;1mChecking dependencies\033[0m"
composer require tests --dev

# shellcheck disable=SC2068
symfony php bin/phpunit $@