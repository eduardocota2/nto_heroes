#!/bin/bash
while true; do
  ./theotxserver4 > data/logs/output.log &
  PID=$!
  echo $PID > theotxserver4.pid
  wait $PID
  sleep 5
done