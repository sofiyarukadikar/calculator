#!/bin/bash

calculate() {
    local num1="$1"
    local operator="$2"
    local num2="$3"
    local mode="$4"

    if [[ "$mode" == "hex" ]]; then
        num1=$((16#$num1))
        num2=$((16#$num2))
    fi

    case "$operator" in
        +) result=$(echo "$num1 + $num2" | bc) ;;
        -) result=$(echo "$num1 - $num2" | bc) ;;
        \*) result=$(echo "$num1 * $num2" | bc) ;;
        /) result=$(echo "scale=2; $num1 / $num2" | bc) ;;
        %) result=$(echo "$num1 % $num2" | bc) ;;
        **) result=$(echo "$num1 ^ $num2" | bc) ;;
        *) echo "Invalid operator"; exit 1 ;;
    esac

    if [[ "$mode" == "hex" ]]; then
        result=$(printf "%X" "$result")
    fi

    echo "Result: $result"
}

while true; do
    echo "Shell Calculator"
    echo "Enter number mode (dec/hex):"
    read mode
    echo "Enter first number:"    
    read num1
    echo "Enter operator (+, -, *, /, %, **):"
    read operator
    echo "Enter second number:"
    read num2
    
    calculate "$num1" "$operator" "$num2" "$mode"
    
    echo "Do you want to perform another calculation? (yes/no)"
    read choice
    if [[ "$choice" != "yes" ]]; then
        break
    fi
done
