#!/bin/bash
while true; do
  ./theotxserver6 > data/logs/output.log &
  PID=$!
  echo $PID > theotxserver6.pid
  wait $PID
  sleep 5
done