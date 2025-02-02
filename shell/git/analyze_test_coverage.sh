
# 23. Test Coverage Impact Analyzer
analyze_test_coverage() {
    local branch="${1:-$(git rev-parse --abbrev-ref HEAD)}"

    echo "=== Test Coverage Impact Analysis ==="

    # Find changed files
    changed_files=$(git diff --name-only "$branch")

    # Analyze test coverage
    echo "Test coverage analysis for changed files:"
    echo "$changed_files" | while read -r file; do
        if [ -f "$file" ]; then
            # Find corresponding test files
            test_file=$(find . -name "*test*.js" -o -name "*spec*.js" -o -name "test_*.py" -o -name "*_test.py" | grep -i "$(basename "$file" | cut -f 1 -d '.')")

            if [ -n "$test_file" ]; then
                echo "Found tests for $file:"
                echo "$test_file" | sed 's/^/  /'

                # Analyze test modifications
                echo "  Test modification history:"
                git log --format="%h - %an: %s" -- "$test_file" | head -n 3 | sed 's/^/    /'
            else
                echo "Warning: No tests found for $file"
            fi
        fi
    done
}
