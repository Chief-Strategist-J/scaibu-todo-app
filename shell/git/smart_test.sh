
# 24. Smart Test Runner
smart_test() {
    local changed_pattern="${1:-*}"

    echo "=== Smart Test Runner ==="

    # Get changed files
    changed_files=$(git diff --name-only HEAD)

    # Find affected tests
    echo "Identifying affected tests..."
    affected_tests=()

    echo "$changed_files" | while read -r file; do
        if [ -f "$file" ]; then
            # Find direct test files
            direct_tests=$(find . -name "*test*.js" -o -name "*spec*.js" -o -name "test_*.py" -o -name "*_test.py" | grep -i "$(basename "$file" | cut -f 1 -d '.')")

            # Find indirect dependencies through imports
            indirect_tests=$(grep -r "import.*$(basename "$file" | cut -f 1 -d '.')" . | grep -E "*test*|*spec*" | cut -d ':' -f 1)

            if [ -n "$direct_tests" ] || [ -n "$indirect_tests" ]; then
                affected_tests+=("$direct_tests" "$indirect_tests")
            fi
        fi
    done

    # Run affected tests
    if [ ${#affected_tests[@]} -gt 0 ]; then
        echo "Running affected tests:"
        for test in "${affected_tests[@]}"; do
            echo "Running $test"
            # Add your test runner command here
            # Example: npm test "$test" or python -m pytest "$test"
        done
    else
        echo "No affected tests found"
    fi
}