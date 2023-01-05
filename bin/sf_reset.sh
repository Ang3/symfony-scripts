#!/bin/bash
set -xeuo pipefail

echo
echo -e "\033[33;1m--- RESETTING APPLICATION ---\033[0m"
echo

sf_restart.sh reset