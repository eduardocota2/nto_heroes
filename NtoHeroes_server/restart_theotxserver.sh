#!/bin/bash
while true; do
  ./theotxserver7 > data/logs/output.log &
  PID=$!
  echo $PID > theotxserver7.pid
  wait $PID
  sleep 5
done