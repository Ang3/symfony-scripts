#!/bin/bash

echo
echo -e "\033[33;1m--- RESTARTING APPLICATION ---\033[0m"
echo

./stop.sh

echo

./start.sh $1