#!/bin/bash
while true; do
  ./theotxserver2_3 > data/logs/output.log &
  PID=$!
  echo $PID > theotxserver2_3.pid
  wait $PID
  sleep 5
done