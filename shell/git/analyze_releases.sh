#!/usr/bin/env bash

# Configuration
VERSION_TAG_PATTERN="v*"           # Version tag pattern (default: "v*")
DATE_FORMAT="%at"                  # Git log date format (committer date)
TIME_UNIT="86400"                  # Number of seconds in a day (for day calculation)

analyze_releases() {
    echo "=== Release Analytics ==="

    # Version tag analysis
    echo "Version Tag Distribution:"
    git tag -l "$VERSION_TAG_PATTERN" --sort=-v:refname | awk -F. '
        {
            major[$1]++
            if (NF > 1) minor[$1"."$2]++
            if (NF > 2) patch[$1"."$2"."$3]++
        }
        END {
            printf "\nMajor versions: %d\n", length(major)
            printf "Average minor releases per major: %.1f\n", length(minor)/length(major)
            printf "Average patches per minor: %.1f\n", length(patch)/length(minor)
        }'

    # Release frequency
    echo -e "\nRelease Frequency Analysis:"
    git tag --sort=committerdate | while read -r tag; do
        git log -1 --format="$DATE_FORMAT" "$tag"
    done | awk -v time_unit="$TIME_UNIT" '
        {
            if (last) {
                diff = $1 - last
                sum += diff
                count++
            }
            last = $1
        }
        END {
            if (count > 0) printf "Average days between releases: %.1f\n", (sum/count)/time_unit
        }'
}

# Execute the function
analyze_releases
