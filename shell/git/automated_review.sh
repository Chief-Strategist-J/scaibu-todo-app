#!/usr/bin/env bash

# Configurable Variables (easy to change)
MAIN_BRANCH="main"  # The branch to compare against for commit messages
MIN_COMMIT_LENGTH=10  # Minimum length for commit messages
MAX_COMMIT_LENGTH=72  # Maximum length for commit messages
FILE_SIZE_THRESHOLD=100  # File size threshold for large file changes (in KB)

# Function to perform automated code review
automated_review() {
    local branch="${1:-$(git rev-parse --abbrev-ref HEAD)}"

    echo "=== Automated Code Review ==="

    # Check file size changes
    echo "Large file changes:"
    git diff --stat "$branch" | awk -v threshold="$FILE_SIZE_THRESHOLD" '$3 > threshold {print}'

    # Check for sensitive information
    echo -e "\nPotential sensitive information:"
    git diff "$branch" | grep -i "password\|secret\|key\|token"

    # Check commit message quality
    echo -e "\nCommit message analysis:"
    git log "$MAIN_BRANCH..$branch" --format="%s" | while read -r msg; do
        length=${#msg}
        if [ $length -lt $MIN_COMMIT_LENGTH ]; then
            echo "Warning: Short commit message: $msg"
        elif [ $length -gt $MAX_COMMIT_LENGTH ]; then
            echo "Warning: Long commit message: $msg"
        fi
    done
}

# Call the function to perform automated review
automated_review
