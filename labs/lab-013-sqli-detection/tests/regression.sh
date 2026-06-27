#!/usr/bin/env bash

TARGET="http://192.168.49.2:30602"

echo "[*] Testing malicious payloads..."
while read -r uri; do
  if [[ -n "$uri" && ! "$uri" =~ ^# ]]; then
    echo "  -> Testing: $uri"
    curl -s "$TARGET$uri" > /dev/null
    sleep 1  # Give Zeek time to process the request
  fi
done < payloads/malicious.txt

echo "[*] Testing benign payloads..."
while read -r uri; do
  if [[ -n "$uri" && ! "$uri" =~ ^# ]]; then
    echo "  -> Testing: $uri"
    curl -s "$TARGET$uri" > /dev/null
    sleep 1  # Give Zeek time to process the request
  fi
done < payloads/benign.txt

echo "[*] Tests completed. Check Loki logs in Grafana."