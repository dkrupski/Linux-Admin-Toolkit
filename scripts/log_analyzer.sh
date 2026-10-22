#!/bin/bash

echo "=== LOG ANALYZER ==="

if [ $# -eq 0 ]; then
    echo "Error: Missing log file."
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File does not exist."
    exit 1
fi

if [ ! -r "$1" ]; then
    echo "Error: File is not readable."
    exit 1
fi

echo "File: $1"

total_lines=$(wc -l < "$1")
echo "Total lines: $total_lines"

info_count=$(awk '$3 == "INFO" {count++} END {print count+0}' "$1")
warning_count=$(awk '$3 == "WARNING" {count++} END {print count+0}' "$1")
error_count=$(awk '$3 == "ERROR" {count++} END {print count+0}' "$1")
echo "INFO: $info_count"
echo "WARNING: $warning_count"
echo "ERROR: $error_count"

if [ -n "$2" ]; then
    echo "=== SEARCH RESULTS ==="
    if ! grep -i "$2" "$1"; then
        echo "No matching entries found."
    fi
fi

