#!/bin/bash

DIR=${1:-.}

echo "🔎 Searching for the biggest files in: $DIR"
echo "--------------------------------------------"

find "$DIR" -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n 10
