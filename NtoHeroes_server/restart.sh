#!/bin/bash
while true; do
  ./theotxserver > data/logs/output.log &
  PID=$!
  echo $PID > theotxserver.pid
  wait $PID
  sleep 5
done