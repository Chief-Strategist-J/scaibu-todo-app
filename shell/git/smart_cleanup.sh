#!/usr/bin/env bash

# Configurable Variables (easy to change)
MAIN_BRANCH="${1:-main}"  # Default to 'main' branch
STALE_DAYS_THRESHOLD=30  # Threshold for stale branches (in days)
BRANCH_DELETION_CONFIRMATION=true  # Whether to ask for confirmation before deleting branches

# Function to perform smart branch cleanup
smart_cleanup() {
    echo "=== Smart Branch Cleanup ==="

    # Find merged branches
    MERGED=$(git branch --merged "$MAIN_BRANCH" 2>/dev/null || git branch --merged master)

    # Find stale branches (no commits in the last STALE_DAYS_THRESHOLD days)
    STALE=$(git branch -r --no-merged | while read -r branch; do
        LAST_COMMIT=$(git log -1 --format=%at "$branch")
        if [ $(($(date +%s) - LAST_COMMIT)) -gt $((STALE_DAYS_THRESHOLD*24*60*60)) ]; then
            echo "$branch"
        fi
    done)

    # Handle merged branches
    if [ -n "$MERGED" ]; then
        echo "Merged branches to delete:"
        echo "$MERGED"
        if [ "$BRANCH_DELETION_CONFIRMATION" = true ]; then
            read -p "Delete these branches? (y/n) " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                echo "$MERGED" | xargs git branch -d
            fi
        else
            echo "Automatic deletion skipped."
        fi
    fi

    # Handle stale branches
    if [ -n "$STALE" ]; then
        echo -e "\nStale branches:"
        echo "$STALE"
        if [ "$BRANCH_DELETION_CONFIRMATION" = true ]; then
            read -p "Delete these branches? (y/n) " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                echo "$STALE" | xargs git branch -D
            fi
        else
            echo "Automatic deletion skipped."
        fi
    fi
}

# Call the function to clean up branches
smart_cleanup
