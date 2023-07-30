#!/bin/bash
while true; do
  ./theotxserver2_1 > data/logs/output.log &
  PID=$!
  echo $PID > theotxserver2_1.pid
  wait $PID
  sleep 5
done