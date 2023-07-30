#!/bin/bash
while true; do
  ./theotxserver8 > data/logs/output.log &
  PID=$!
  echo $PID > theotxserver8.pid
  wait $PID
  sleep 5
done