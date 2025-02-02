#!/usr/bin/env bash

analyze_commits() {
    branch="${1:-$(git rev-parse --abbrev-ref HEAD)}"
    days="${2:-30}"

    echo "=== Commit Analysis for last $days days ==="
    since="$days days ago"

    echo "Commit frequency by day of week:"
    git log --since="$since" --date=format:"%A" --format="%ad" "$branch" | sort | uniq -c

    echo -e "\nCommit frequency by hour:"
    git log --since="$since" --date=format:"%H" --format="%ad" "$branch" | sort | uniq -c

    echo -e "\nAverage commit size:"
    git log --since="$since" --pretty=format: --stat "$branch" | awk '
        /^ [0-9]/ {
            files += 1
            insertions += $4
            deletions += $6
        } END {
            if (NR > 0) {
                printf "Files per commit: %.2f\n", files/NR
                printf "Lines changed per commit: %.2f\n", (insertions+deletions)/NR
            }
        }'
}