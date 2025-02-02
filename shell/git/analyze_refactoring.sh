analyze_refactoring() {
    local file_pattern="${1:-*}"

    echo "=== Refactoring Impact Analysis ==="

    # Analyze function changes
    echo "Function modification analysis:"
    git ls-files "*.$file_pattern" | while read -r file; do
        if [ -f "$file" ]; then
            echo "Analyzing $file..."

            # Extract function definitions and their history
            case "$file" in
                *.js|*.ts)
                    functions=$(grep -E "function.*\(.*\)|const.*=.*\(.*\).*=>" "$file")
                    ;;
                *.py)
                    functions=$(grep -E "^[[:space:]]*def.*\(.*\):" "$file")
                    ;;
                *.java)
                    functions=$(grep -E "^[[:space:]]*(public|private|protected).*\(.*\)" "$file")
                    ;;
            esac

            if [ -n "$functions" ]; then
                echo "Functions found:"
                echo "$functions" | sed 's/^/  /'

                # Track function modifications
                echo "  Modification history:"
                git log -L "/$(echo "$functions" | head -n 1)/",+1:"$file" --pretty=format:"%h - %an: %s" | head -n 3 | sed 's/^/    /'
            fi
        fi
    done
}
