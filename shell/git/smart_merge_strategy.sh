#!/usr/bin/env bash

# Configurable Variables (easy to change)
SOURCE_BRANCH="$1"  # Source branch (passed as an argument)
TARGET_BRANCH="${2:-main}"  # Default target branch is 'main'
CONFLICT_RISK_THRESHOLD_MEDIUM=3  # Threshold for medium risk (number of conflicts)
CONFLICT_RISK_THRESHOLD_HIGH=5  # Threshold for high risk (number of conflicts)

# Function to apply advanced merge strategy based on conflict risk
smart_merge_strategy() {
    echo "=== Smart Merge Strategy ==="

    # Analyze changes
    CHANGES=$(git diff --name-only "$SOURCE_BRANCH".."$TARGET_BRANCH")
    CONFLICT_RISK=0

    while read -r FILE; do
        if [ -n "$FILE" ]; then
            # Check if the same files are modified in both branches
            if git log -1 --format="%H" "$TARGET_BRANCH" -- "$FILE" >/dev/null 2>&1 &&
               git log -1 --format="%H" "$SOURCE_BRANCH" -- "$FILE" >/dev/null 2>&1; then
                CONFLICT_RISK=$((CONFLICT_RISK + 1))
            fi
        fi
    done <<< "$CHANGES"

    # Choose merge strategy based on risk
    if [ $CONFLICT_RISK -eq 0 ]; then
        echo "Low risk merge - using fast-forward"
        git merge --ff-only "$SOURCE_BRANCH"
    elif [ $CONFLICT_RISK -lt $CONFLICT_RISK_THRESHOLD_MEDIUM ]; then
        echo "Medium risk merge - using recursive strategy"
        git merge --strategy-option=patience "$SOURCE_BRANCH"
    else
        echo "High risk merge - using manual merge"
        git merge --no-commit --no-ff "$SOURCE_BRANCH"
    fi
}

# Call the function to perform the smart merge
smart_merge_strategy
