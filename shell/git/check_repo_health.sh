#!/usr/bin/env bash

# Configurable Variables (easy to change)
LARGE_FILE_SIZE_THRESHOLD=1M  # Threshold for large files (default 1M)
LONG_FILE_PATH_THRESHOLD=100  # Threshold for long file paths (default 100 characters)
STALE_BRANCHES_IGNORE="master|main"  # Branches to ignore when checking for stale branches

# Function to check repository health
check_repo_health() {
    echo "=== Repository Health Check ==="

    # Check for large files
    echo "Checking for large files..."
    find . -type f -size +"$LARGE_FILE_SIZE_THRESHOLD" ! -path "./.git/*" -exec du -h {} \; | sort -rh | head -n 5

    # Check for binary files
    echo -e "\nChecking for binary files..."
    find . -type f ! -path "./.git/*" -exec file {} \; | grep -v text | head -n 5

    # Check for long file paths
    echo -e "\nChecking for long file paths..."
    find . -type f ! -path "./.git/*" | awk -v threshold="$LONG_FILE_PATH_THRESHOLD" 'length($0) > threshold'

    # Check git configs
    echo -e "\nChecking git configurations..."
    git config --list | grep -E "user|core|remote"

    # Check remote status
    echo -e "\nChecking remote status..."
    git remote -v
    git remote show origin

    # Check for stale branches
    echo -e "\nChecking for stale branches..."
    git branch -r --merged | grep -vE "$STALE_BRANCHES_IGNORE"
}

# Call the function to check repository health
check_repo_health
