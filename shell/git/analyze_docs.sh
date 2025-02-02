analyze_docs() {
    echo "=== Documentation Analysis ==="

    # Check documentation coverage
    echo "Documentation coverage analysis:"
    git ls-files "*.js" "*.ts" "*.py" "*.java" | while read -r file; do
        if [ -f "$file" ]; then
            total_functions=0
            documented_functions=0

            case "$file" in
                *.js|*.ts)
                    total_functions=$(grep -c -E "function.*\(.*\)|const.*=.*\(.*\).*=>" "$file")
                    documented_functions=$(grep -B 1 -E "function.*\(.*\)|const.*=.*\(.*\).*=>" "$file" | grep -c "\/\*\*\|\*\/\|\/\/")
                    ;;
                *.py)
                    total_functions=$(grep -c -E "^[[:space:]]*def.*\(.*\):" "$file")
                    documented_functions=$(grep -B 1 -E "^[[:space:]]*def.*\(.*\):" "$file" | grep -c '"""')
                    ;;
                *.java)
                    total_functions=$(grep -c -E "^[[:space:]]*(public|private|protected).*\(.*\)" "$file")
                    documented_functions=$(grep -B 1 -E "^[[:space:]]*(public|private|protected).*\(.*\)" "$file" | grep -c "\/\*\*\|\*\/")
                    ;;
            esac

            if [ "$total_functions" -gt 0 ]; then
                coverage=$((documented_functions * 100 / total_functions))
                echo "$file: $coverage% documented ($documented_functions/$total_functions functions)"
            fi
        fi
    done
}