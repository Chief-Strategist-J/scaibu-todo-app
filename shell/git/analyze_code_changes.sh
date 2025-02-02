#!/usr/bin/env bash

# Configuration
DAYS="${1:-30}"                  # Number of days to analyze (default: 30 days)
FILE_PATTERN="${2:-*}"           # File pattern to filter by (default: all files)
TOP_N_FILES=10                   # Number of top files to show in churn analysis

analyze_code_changes() {
    echo "=== Deep Code Change Analysis ==="

    # Analyze code churn
    echo "Code Churn Analysis (last $DAYS days):"
    git log --since="$DAYS days ago" --numstat | awk '
        /^[0-9]/ {
            insertions += $1
            deletions += $2
            files[$3]++
            churn[$3] += $1 + $2
        }
        END {
            printf "\nTop changed files:\n"
            for (file in churn) {
                printf "%s: %d changes, %d times modified\n", file, churn[file], files[file]
            }
        }' | sort -rn -k2 | head -"$TOP_N_FILES"

    # Analyze commit message patterns
    echo -e "\nCommit Pattern Analysis:"
    git log --since="$DAYS days ago" --format="%s" |
    awk '
        /^feat:/ {features++}
        /^fix:/ {fixes++}
        /^refactor:/ {refactors++}
        /^docs:/ {docs++}
        /^test:/ {tests++}
        {total++}
        END {
            printf "Features: %.1f%%\n", (features/total)*100
            printf "Fixes: %.1f%%\n", (fixes/total)*100
            printf "Refactors: %.1f%%\n", (refactors/total)*100
            printf "Docs: %.1f%%\n", (docs/total)*100
            printf "Tests: %.1f%%\n", (tests/total)*100
        }'
}

# Execute the function
analyze_code_changes
