#!/usr/bin/env bash

# Configurable Variables (easy to change)
TARGET_BRANCH="${1:-main}"  # Default target branch is master
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
MAX_LOG_LINES=3  # Number of commit lines to display for conflicts

# Function to detect merge conflicts
detect_collisions() {
    echo "Checking potential merge conflicts with $TARGET_BRANCH..."

    # Get modified files in current branch
    CURRENT_FILES=$(git diff --name-only "$TARGET_BRANCH"..."$CURRENT_BRANCH")

    # Check each file for potential conflicts
    echo "$CURRENT_FILES" | while read -r FILE; do
        if [ -n "$FILE" ]; then
            TARGET_CHANGES=$(git log -p "$TARGET_BRANCH" -- "$FILE")
            CURRENT_CHANGES=$(git log -p "$CURRENT_BRANCH" -- "$FILE")

            if echo "$TARGET_CHANGES" "$CURRENT_CHANGES" | grep -q '^@@'; then
                echo "Potential conflict in: $FILE"
                echo "Lines modified in $TARGET_BRANCH:"
                git log --format="%h - %an: %s" "$TARGET_BRANCH" -- "$FILE" | head -n $MAX_LOG_LINES
            fi
        fi
    done
}

# Call the function to start detecting conflicts
detect_collisions
