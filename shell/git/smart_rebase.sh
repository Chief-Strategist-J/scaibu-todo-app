#!/usr/bin/env bash

# Configurable Variables (easy to change)
TARGET_BRANCH="${1:-master}"  # Default target branch is master
CONFLICT_PROBABILITY_THRESHOLD=0  # The threshold to trigger the conflict warning
AUTO_STASH=true  # Whether to auto-stash changes before rebase

# Function for advanced rebase with conflict probability checking
smart_rebase() {
    # Store current branch
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

    echo "Analyzing commits to rebase..."

    # Get list of commits to be rebased
    COMMITS_TO_REBASE=$(git log "$TARGET_BRANCH..$CURRENT_BRANCH" --oneline)
    COMMIT_COUNT=$(echo "$COMMITS_TO_REBASE" | wc -l)

    echo "Found $COMMIT_COUNT commits to rebase"

    # Check for merge conflicts probability
    CONFLICT_PROBABILITY=0
    while read -r COMMIT; do
        HASH=$(echo "$COMMIT" | cut -d' ' -f1)
        FILES_CHANGED=$(git show --name-only --format="" "$HASH")

        while read -r FILE; do
            if [ -n "$FILE" ]; then
                if git log "$TARGET_BRANCH" --format=oneline -- "$FILE" | grep -q .; then
                    CONFLICT_PROBABILITY=$((CONFLICT_PROBABILITY + 1))
                fi
            fi
        done <<< "$FILES_CHANGED"
    done <<< "$COMMITS_TO_REBASE"

    if [ $CONFLICT_PROBABILITY -gt $CONFLICT_PROBABILITY_THRESHOLD ]; then
        echo "Warning: High probability of conflicts ($CONFLICT_PROBABILITY files at risk)"
        read -p "Continue with rebase? (y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            return 1
        fi
    fi

    # Perform rebase with auto-stashing if enabled
    if [ "$AUTO_STASH" = true ]; then
        git stash push -m "Auto stash before rebase"
    fi

    git rebase -i "$TARGET_BRANCH"
}

# Call the function to perform the smart rebase
smart_rebase
