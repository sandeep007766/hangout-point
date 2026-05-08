#!/bin/bash

echo "Running test..."

response=$(curl -s http://localhost)

if echo "$response" | grep -q "Hangout Point"; then
  echo "TEST PASSED"
  exit 0
else
  echo "TEST FAILED"
  exit 1
fi
