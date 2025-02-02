#!/usr/bin/env bash

# Configuration
BRANCH="${1:-$(git rev-parse --abbrev-ref HEAD)}"  # Default to current branch if not provided
DIFF_FORMAT="--stat"                               # Git diff format for file changes
PERFORMANCE_PATTERNS="while\|for\|sleep\|delay"    # Patterns to check for potential performance impacts

analyze_performance() {
    echo "=== Performance Impact Analysis ==="

    # Analyze file size changes
    echo "File size impact:"
    git diff $DIFF_FORMAT "$BRANCH" | awk '
        {
            added += $4
            removed += $6
        }
        END {
            printf "Net change: +%d -%d lines\n", added, removed
            printf "Impact: %.1f%%\n", (added-removed)/(added+removed)*100
        }'

    # Check for potential performance issues
    echo -e "\nPotential performance impacts:"
    git diff "$BRANCH" | grep -B2 -A2 "$PERFORMANCE_PATTERNS"
}

# Execute the function
analyze_performance
