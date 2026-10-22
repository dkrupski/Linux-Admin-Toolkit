#!/bin/bash

echo "=== NETWORK MONITOR ==="

if [ -z "$1" ]; then
    echo "Error: Missing host."
    exit 1
fi

if ping -c 2 "$1" > /dev/null 2>&1; then
    echo "Host is reachable."
else
    echo "Host is unreachable."
fi

if [ -n "$2" ]; then
    if [[ ! "$2" =~ ^[0-9]+$ ]]; then
        echo "Error: Invalid port number."
        exit 1
    fi
    if [ ${#2} -gt 5 ]; then
        echo "Error: Invalid port number."
        exit 1
    fi
    if [ "${2:0:1}" = "0" ]; then
        echo "Error: Invalid port number."
        exit 1
    fi
    if [ "$2" -lt 1 ] || [ "$2" -gt 65535 ];then
        echo "Error: Invalid port number."
        exit 1
    fi 
    if ss -tuln | grep -E ":$2[[:space:]]" > /dev/null 2>&1; then
        echo "Port $2 is listening."
    else
        echo "Port $2 is not listening."
    fi 
fi 

if [ -n "$3" ]; then
    if http_status=$(curl --max-time 5 -s -o /dev/null -w "%{http_code}" "$3"); then
        echo "HTTP Status: $http_status"
    else
        echo "Error: HTTP connection failed."
    fi
fi
