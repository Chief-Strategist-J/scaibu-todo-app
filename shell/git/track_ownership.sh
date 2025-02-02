#!/usr/bin/env bash

# Configurable Variables (easy to change)
FILE_PATTERN="${1:-.}"  # Default to current directory
AUTHOR_SORT_OPTION="sort"  # Sorting option for authors (can be adjusted)
PRINCIPAL_AUTHOR_COUNT=1  # Number of top authors to display for file ownership

# Function to track code ownership
track_ownership() {
    echo "=== Code Ownership Analysis ==="

    # Get total lines per author
    echo "Lines of code by author:"
    git ls-files "$FILE_PATTERN" | while read -r FILE; do
        git blame --line-porcelain "$FILE" 2>/dev/null | grep "^author " | $AUTHOR_SORT_OPTION | uniq -c
    done | awk '{a[$2]+=$1} END{for(i in a) print a[i], i}' | sort -rn

    # Get file ownership
    echo -e "\nFile ownership (most modified by):"
    git ls-files "$FILE_PATTERN" | while read -r FILE; do
        if [ -f "$FILE" ]; then
            PRINCIPAL_AUTHOR=$(git blame --line-porcelain "$FILE" | grep "^author " | sort | uniq -c | sort -rn | head -n $PRINCIPAL_AUTHOR_COUNT)
            echo "$FILE: $PRINCIPAL_AUTHOR"
        fi
    done
}

# Call the function to track ownership
track_ownership
