#!/bin/bash

echo
echo -e "\033[33;1m--- RESTARTING APPLICATION ---\033[0m"
echo

sh vendor/bin/stop.sh

echo

sh vendor/bin/start.sh $1