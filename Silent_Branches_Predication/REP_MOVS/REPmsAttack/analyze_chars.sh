#!/bin/bash

KEY_CHAR=${1:-T}
echo "Compiling with key='$KEY_CHAR'..."
make clean
make KEY="'$KEY_CHAR'"

declare -A count
max_count=0
secret_char=""

for i in {1..50}; do
    echo "Run $i..."

    bin=$(./v1REP | grep -o '[01]\{8\}' | head -n 1)

    
        dec=$((2#$bin))
    if (( dec != 0 )); then
        char=$(echo -e "\x$(printf %x $dec)")
        if [[ "$char" =~ [[:print:]] && "$char" != " " ]]; then
            echo "bin: $bin, dec: $dec, char: $char"
            count["$char"]=$(( ${count["$char"]} + 1 ))

        
            if (( ${count["$char"]} > max_count )); then
                max_count=${count["$char"]}
                secret_char=$char
            fi
        fi

    fi

done

echo ""
echo "=== Character Statistics ==="
for char in "${!count[@]}"; do
    printf "%s: %d\n" "$char" "${count[$char]}"
done

echo ""
echo "The most frequent character (guessed secret character) is: $secret_char"