#!/usr/bin/env bash

# Configurable Variables (easy to change)
DEFAULT_DAYS=30  # Default number of days to analyze for workflow metrics

# Function to analyze git workflow metrics
analyze_workflow() {
    local days="$1"  # Accept days as an argument
    # If days is not passed, use the default
    days="${days:-$DEFAULT_DAYS}"

    echo "=== Workflow Analysis for last $days days ==="

    # Time to merge analysis
    echo "Average time to merge PRs:"
    git log --merges --since="$days days ago" --format="%ai" |
    awk '{
        split($1,date,"-")
        split($2,time,":")
        timestamp=mktime(date[1] " " date[2] " " date[3] " " time[1] " " time[2] " " time[3])
        if(prev) print (timestamp-prev)/3600 " hours"
        prev=timestamp
    }' |
    awk '{ total += $1; count++ } END { print total/count " hours average" }'

    # Branch lifetime
    echo -e "\nBranch lifetimes:"
    git for-each-ref --sort=-committerdate refs/heads/ \
        --format='%(committerdate:relative)|%(refname:short)' |
        while IFS='|' read -r date branch; do
            if [ "$branch" != "master" ] && [ "$branch" != "main" ]; then
                echo "$branch: $date"
            fi
        done
}

# Call the function to analyze workflow, pass a custom number of days (optional)
analyze_workflow "$1"  # Pass the first argument passed to the script, if any.
