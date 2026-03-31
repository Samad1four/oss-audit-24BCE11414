#!/bin/bash
# =============================================================================
# Script 4: Log File Analyzer
# Author: Abdul Samad Khan | Course: Open Source Software | VITyarthi
# Chosen Software: Git
# Concepts Used: while-read loop, if-then, counter variables, $1 $2 arguments,
#                tail + grep for last matching lines, input validation
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# =============================================================================

# --- Command-line arguments ---
LOGFILE=$1                      # First argument: path to log file
KEYWORD=${2:-"error"}           # Second argument: keyword to search (default: error)

# --- Counter variable to track keyword occurrences ---
COUNT=0

echo "============================================================"
echo "         Log File Analyzer"
echo "============================================================"

# --- Input validation: check if a file path was provided ---
if [ -z "$LOGFILE" ]; then
    echo "[!!] ERROR: No log file specified."
    echo "     Usage: ./script4_log_analyzer.sh <logfile> [keyword]"
    echo "     Example: ./script4_log_analyzer.sh /var/log/syslog error"
    exit 1
fi

# --- Check if the file actually exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "[!!] ERROR: File '$LOGFILE' not found."
    echo ""
    # Retry suggestion — do-while style: inform user and exit gracefully
    RETRY=0
    while [ $RETRY -lt 1 ]; do
        echo "     Tip: Create a test log file with:"
        echo "     echo -e 'INFO: started\nERROR: failed\nWARNING: low memory\nERROR: timeout' > test.log"
        echo "     Then run: ./script4_log_analyzer.sh test.log error"
        RETRY=$((RETRY + 1))  # Increment retry counter
    done
    exit 1
fi

# --- Check if the file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "[!!] WARNING: '$LOGFILE' is empty. No lines to analyse."
    exit 1
fi

echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD' (case-insensitive search)"
echo "============================================================"
echo ""

# --- while-read loop: read the log file line by line ---
while IFS= read -r LINE; do
    # if-then: check if current line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))    # Increment counter each time keyword is found
    fi
done < "$LOGFILE"   # Feed the file into the while loop via redirection

# --- Display summary ---
echo "--- Analysis Summary ---"
echo "  Total lines in file : $(wc -l < "$LOGFILE")"
echo "  Keyword '$KEYWORD' found : $COUNT time(s)"
echo ""

# --- Show last 5 matching lines using tail + grep ---
if [ $COUNT -gt 0 ]; then
    echo "--- Last 5 Lines Containing '$KEYWORD' ---"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
else
    echo "  No lines matched keyword '$KEYWORD' in this file."
fi

echo ""
echo "============================================================"
echo " Connection to Git: Git's own operations log events to"
echo " ~/.git/logs/ — understanding log analysis is essential"
echo " for debugging version control issues in real projects."
echo "============================================================"
