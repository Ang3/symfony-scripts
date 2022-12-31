#!/bin/bash

echo
echo -e "\033[33;1m--- RESTARTING APPLICATION ---\033[0m"
echo

./sf_stop.sh

echo

./sf_start.sh $1