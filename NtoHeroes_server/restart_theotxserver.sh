#!/bin/bash
while true; do
  ./theotxserver2 > data/logs/output.log &
  PID=$!
  echo $PID > theotxserver2.pid
  wait $PID
  sleep 5
done