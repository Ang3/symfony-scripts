#!/bin/bash
set -xeuo pipefail

echo
echo -e "\033[33;1m--- RESTARTING APPLICATION ---\033[0m"
echo

# shellcheck disable=SC2068
sf_stop.sh $@

# shellcheck disable=SC2068
sf_start.sh $@
