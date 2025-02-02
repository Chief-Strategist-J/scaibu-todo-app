detect_dead_code() {
    echo "=== Dead Code Detection ==="

    # Find unused functions
    echo "Potentially unused functions:"
    git ls-files "*.js" "*.ts" "*.py" "*.java" | while read -r file; do
        if [ -f "$file" ]; then
            case "$file" in
                *.js|*.ts)
                    functions=$(grep -E "function.*\(.*\)|const.*=.*\(.*\).*=>" "$file" | sed -E 's/function[[:space:]]+([a-zA-Z0-9_]+).*/\1/')
                    ;;
                *.py)
                    functions=$(grep -E "^[[:space:]]*def.*\(.*\):" "$file" | sed -E 's/[[:space:]]*def[[:space:]]+([a-zA-Z0-9_]+).*/\1/')
                    ;;
                *.java)
                    functions=$(grep -E "^[[:space:]]*(public|private|protected).*\(.*\)" "$file" | sed -E 's/.*[[:space:]]+([a-zA-Z0-9_]+)[[:space:]]*\(.*/\1/')
                    ;;
            esac

            if [ -n "$functions" ]; then
                echo "$functions" | while read -r func; do
                    usage_count=$(git grep -l "$func" | wc -l)
                    if [ "$usage_count" -eq 1 ]; then
                        echo "Potential dead function in $file: $func"
                    fi
                done
            fi
        fi
    done
}