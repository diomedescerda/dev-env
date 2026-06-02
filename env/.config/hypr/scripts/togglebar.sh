#!/bin/bash

FILE="/tmp/bar-hidden"

if [[ "$(cat "$FILE" 2>/dev/null)" == "true" ]]; then
    echo "false" > "$FILE"
else
    echo "true" > "$FILE"
fi
