calculate() {
    local num1="$1"
    local operator="$2"
    local num2="$3"

    case "$operator" in
        +) result=$(echo "$num1 + $num2" | bc) ;;
        -) result=$(echo "$num1 - $num2" | bc) ;;
        \*) result=$(echo "$num1 * $num2" | bc) ;;
        /) result=$(echo "scale=2; $num1 / $num2" | bc) ;;
        %) result=$(echo "$num1 % $num2" | bc) ;;
        **) result=$(echo "$num1 ^ $num2" | bc) ;;
        *) echo "Invalid operator"; exit 1 ;;
    esac

    echo "Result: $result"
}

while true; do
    echo "Shell Calculator"
    echo "Enter first number:"
    read num1
    echo "Enter operator (+, -, *, /, %, **):"
    read operator
    echo "Enter second number:"
    read num2
    
    calculate "$num1" "$operator" "$num2"
    
    echo "Do you want to perform another calculation? (yes/no)"
    read choice
    if [[ "$choice" != "yes" ]]; then
        break
    fi
done