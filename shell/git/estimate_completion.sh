#!/usr/bin/env bash


# Configurable Variables (easy to change)
BRANCH="${1:-$(git rev-parse --abbrev-ref HEAD)}"  # Default to current branch
BASE_BRANCH="${2:-main}"  # Default base branch is main
DAYS_BACK="30"  # Number of days to consider for commit velocity
TODO_PATTERN="TODO\|FIXME"  # Patterns to search for in the codebase
ISSUE_PATTERN="fixes\|closes"  # Patterns to detect open issues

# Function to estimate feature completion
estimate_completion() {
    echo "=== Feature Completion Estimation ==="

    # Get commit velocity
    COMMITS_PER_DAY=$(git log --since="$DAYS_BACK days ago" --format=oneline "$BRANCH" | wc -l)
    VELOCITY=$(echo "scale=2; $COMMITS_PER_DAY / $DAYS_BACK" | bc)

    # Get remaining work estimation
    TODO_COUNT=$(git grep -l "$TODO_PATTERN" | wc -l)
    OPEN_ISSUES=$(git log "$BASE_BRANCH..$BRANCH" | grep -ci "$ISSUE_PATTERN")

    echo "Commit velocity: $VELOCITY commits per day"
    echo "Remaining TODOs: $TODO_COUNT"
    echo "Open issues referenced: $OPEN_ISSUES"

    # Rough estimation
    ESTIMATED_DAYS=$(echo "scale=0; ($TODO_COUNT + $OPEN_ISSUES) / $VELOCITY" | bc)
    echo "Rough completion estimate: $ESTIMATED_DAYS days"
}

# Call the function to estimate completion
estimate_completion
