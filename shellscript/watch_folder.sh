#!/bin/bash

# Ever had a config file magically change and nobody on the team "remembers doing it"? This script helps you detect file changes in real-time using inotifywait—perfect for monitoring sensitive directories like /etc, /var/www, or your secret bash scripts folder 👀.
#You need inotify-tools installed
WATCH_DIR=${1:-/etc}
EVENTS="modify,create,delete,move"
LOGFILE="watch_$(basename $WATCH_DIR)_$(date +%F).log"

echo "👁️ Watching $WATCH_DIR for changes..."
inotifywait -m -r -e $EVENTS "$WATCH_DIR" --format '%T %w%f %e' --timefmt '%F %T' | tee -a "$LOGFILE"
