analyze_complexity() {
    local file_pattern="${1:-*}"

    echo "=== Code Complexity Analysis ==="

    git ls-files "*.$file_pattern" | while read -r file; do
        if [ -f "$file" ]; then
            echo "Analyzing $file..."

            # Calculate cyclomatic complexity (rough estimate)
            case "$file" in
                *.js|*.ts)
                    conditions=$(grep -c -E "if|while|for|switch|catch|&&|\|\|" "$file")
                    functions=$(grep -c -E "function.*\(.*\)|=>.*{" "$file")
                    ;;
                *.py)
                    conditions=$(grep -c -E "if|while|for|try|and|or" "$file")
                    functions=$(grep -c -E "def.*\(.*\):" "$file")
                    ;;
                *.java)
                    conditions=$(grep -c -E "if|while|for|switch|catch|&&|\|\|" "$file")
                    functions=$(grep -c -E "(public|private|protected).*\(.*\)" "$file")
                    ;;
            esac

            complexity=$((conditions + functions))
            echo "Estimated complexity score: $complexity"
            echo "  Functions: $functions"
            echo "  Control structures: $conditions"
        fi
    done
}
