#!/bin/bash
while true; do
  ./theotxserver2_2 > data/logs/output.log &
  PID=$!
  echo $PID > theotxserver2_2.pid
  wait $PID
  sleep 5
done