#!/bin/bash

rcx_values=(0 4 8 16 32 64 72 80 128 200 256 300 400 500 512 600 640 700)
SOURCE="measuret.c"
BINARY="measuret"
LOG_FILE="run_all_output.log"

echo "Running tests... Log saved to $LOG_FILE" > "$LOG_FILE"  

for value in "${rcx_values[@]}"; do
   { echo "=== RCX = $value ==="

       make RCX="$value" 

    if [[ $? -eq 0 ]]; then
        echo "Running with RCX = $value"
        ./"$BINARY"
    else
        echo "Compilation failed with RCX = $value"
    fi

    echo "======================="

        make clean
   } | tee -a "$LOG_FILE"
done
