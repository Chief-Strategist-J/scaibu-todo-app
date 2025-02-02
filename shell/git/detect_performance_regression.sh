detect_performance_regression() {
    local days="${1:-30}"

    echo "=== Performance Regression Detection ==="

    # Analyze performance-related changes
    echo "Performance-Related Changes:"
    git log --since="$days days ago" --grep="performance\|optimize\|slow\|fast" --pretty=format:"  %h - %s"

    # Check for common performance anti-patterns
    echo -e "\nPerformance Anti-Pattern Check:"
    git ls-files | while read -r file; do
        if [ -f "$file" ]; then
            case "$file" in
                *.js|*.ts)
                    echo "Checking $file for JavaScript/TypeScript anti-patterns..."
                    patterns=(
                        "for.*in.*length"
                        ".*\.forEach.*function.*"
                        "document\.write"
                    )
                    ;;
                *.py)
                    echo "Checking $file for Python anti-patterns..."
                    patterns=(
                        "for.*in.*range.*len"
                        "\.copy()"
                        "except:.*pass"
                    )
                    ;;
                *.java)
                    echo "Checking $file for Java anti-patterns..."
                    patterns=(
                        "String.*\+="
                        "Vector"
                        "\.size().*for"
                    )
                    ;;
            esac

            for pattern in "${patterns[@]}"; do
                matches=$(grep -n "$pattern" "$file" 2>/dev/null)
                if [ -n "$matches" ]; then
                    echo "  Found potential performance issue:"
                    echo "$matches" | sed 's/^/    /'
                fi
            done
        fi
    done
}