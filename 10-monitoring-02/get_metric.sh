#!/bin/bash

# Get time
timestamp=$(date +'%Y-%m-%d %H:%M:%S')

# Get memmory total size (kB)
memmpry_total=$(cat /proc/meminfo | awk 'NR==1 {print $2}')

# Get memory free size (kB)
memmory_free=$(cat /proc/meminfo | awk 'NR==2 {print $2}')

# Get memmory available sizi (kB)
memmory_available=$(cat /proc/meminfo | awk 'NR==3 {print $2}')

# Get CPU load avarege for 1 minute
cpu_load1=$(cat /proc/loadavg | awk '{print $1}')

# Get CPU load avarege for 5 minute
cpu_load5=$(cat /proc/loadavg | awk '{print $2}')

# Get CPU load avarege for 15 minute
cpu_load15=$(cat /proc/loadavg | awk '{print $3}')

echo -en "{\
\"timestamp\": \"$timestamp\",\
\"memmpry_total\": \"$memmpry_total\",\
\"memmory_free\": \"$memmory_free\",\
\"memmory_available\": \"$memmory_available\",\
\"cpu_load1\": \"$cpu_load1\",\
\"cpu_load5\": \"$cpu_load5\",\
\"cpu_load15\": \"$cpu_load15\"\
}\n" | sudo tee -a "/var/log/$(echo "$timestamp" | awk '{print $1}')-awesome-monitoring.log"

