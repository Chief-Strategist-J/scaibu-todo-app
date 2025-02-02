#!/usr/bin/env bash

# Configuration
DAYS="${1:-90}"                  # Days for collaboration analysis (default is 90)
FORMAT="%h|%an|%ad|%s"            # Git log format for commits
PAIR_REGEX="Co-authored-by:"      # Regex for pair programming
REVIEW_REGEX="Reviewed-by|LGTM|Approved"  # Regex for code review keywords
TIME_FORMAT="%ct"                 # Time format for commit and review times

analyze_collaboration() {
    echo "=== Team Collaboration Analysis ==="

    # Pair programming detection
    echo "Potential Pair Programming Sessions:"
    git log --since="$DAYS days ago" --format="$FORMAT" | while IFS='|' read -r hash author date msg; do
        coauthor=$(echo "$msg" | grep -o "$PAIR_REGEX [^<]*" || true)
        if [ -n "$coauthor" ]; then
            echo "$date: $author with $coauthor"
        fi
    done

    # Code review metrics
    echo -e "\nCode Review Statistics:"
    git log --since="$DAYS days ago" --format="$FORMAT" | while IFS='|' read -r hash author msg; do
        if echo "$msg" | grep -q "$REVIEW_REGEX"; then
            review_time=$(git log -1 --format="$TIME_FORMAT" "$hash")
            commit_time=$(git log -1 --format="$TIME_FORMAT" "$hash^")
            echo "$((review_time - commit_time)) seconds for review"
        fi
    done | awk '
        {sum += $1; count++}
        END {
            if (count > 0) printf "Average review time: %.1f hours\n", (sum/count)/3600
        }'
}

# Execute the function
analyze_collaboration
