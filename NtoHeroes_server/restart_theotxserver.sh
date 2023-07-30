#!/bin/bash
while true; do
  ./theotxserver5 > data/logs/output.log &
  PID=$!
  echo $PID > theotxserver5.pid
  wait $PID
  sleep 5
done