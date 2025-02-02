#!/usr/bin/env bash

# Configurable Variables (easy to change)
DEPENDENCIES=("git" "awk" "bc" "stat" "jq" "parallel")  # List of dependencies to check

# Function to check dependencies
check_dependencies() {
    local missing=()

    for dep in "${DEPENDENCIES[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            missing+=("$dep")
        fi
    done

    if [ ${#missing[@]} -ne 0 ]; then
        echo "Missing dependencies: ${missing[*]}"
        return 1
    fi
}

# Call the function to check dependencies
check_dependencies
