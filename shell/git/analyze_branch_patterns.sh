#!/usr/bin/env bash

# Configurable Variables (easy to change)
FEATURE_PATTERN="feature"
FIX_PATTERN="fix"
HOTFIX_PATTERN="hotfix"
RELEASE_PATTERN="release"
DEV_PATTERN="dev"
TOP_BRANCHES_COUNT=10  # Number of top branches to display based on lifetime

# Function to analyze branch patterns
analyze_branch_patterns() {
    echo "=== Branch Pattern Analysis ==="

    # Branch naming patterns
    echo "Branch Naming Patterns:"
    git branch -r | awk -v feature="$FEATURE_PATTERN" -v fix="$FIX_PATTERN" -v hotfix="$HOTFIX_PATTERN" \
        -v release="$RELEASE_PATTERN" -v dev="$DEV_PATTERN" '
        /feature/ {feature++}
        /fix/ {fix++}
        /hotfix/ {hotfix++}
        /release/ {release++}
        /dev/ {dev++}
        {total++}
        END {
            printf "Feature branches: %.1f%%\n", (feature/total)*100
            printf "Fix branches: %.1f%%\n", (fix/total)*100
            printf "Hotfix branches: %.1f%%\n", (hotfix/total)*100
            printf "Release branches: %.1f%%\n", (release/total)*100
            printf "Development branches: %.1f%%\n", (dev/total)*100
        }'

    # Branch lifetime analysis
    echo -e "\nBranch Lifetime Analysis:"
    git for-each-ref refs/heads/ --format='%(refname:short)|%(creatordate:unix)|%(committerdate:unix)' |
    while IFS='|' read -r branch created modified; do
        age=$((modified - created))
        echo "$branch|$age"
    done | sort -t'|' -k2 -nr | head -n "$TOP_BRANCHES_COUNT" |
    awk -F'|' '{printf "%s: %.1f days\n", $1, $2/86400}'
}

# Call the function to analyze branch patterns
analyze_branch_patterns
