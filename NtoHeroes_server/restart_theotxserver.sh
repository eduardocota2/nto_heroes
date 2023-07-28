#!/bin/bash
while true; do
  ./theotxserver3 > data/logs/output.log &
  PID=$!
  echo $PID > theotxserver3.pid
  wait $PID
  sleep 5
done