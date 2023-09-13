#!/bin/bash
# display command line options

count=1
for param in "$@"; do
    echo "Next Parameter: $param"
    count=$(( $count + 1 ))
done

echo "====="

# Будем считать что тут тоже что-то поменялось в коде :)

# Конфликт с Next Parameter