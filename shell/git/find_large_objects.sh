#!/usr/bin/env bash

# Configuration Section - Edit these values as needed
DEFAULT_SIZE_LIMIT="1M"            # Default size limit (1MB)
USE_COLOR=true                     # Enable colored output
CHECK_DEPENDENCIES=true            # Verify required tools exist
SHOW_SUMMARY=true                  # Display git-sizer summary
SHOW_DETAILS=true                  # Show large files details
NUM_TOP_OBJECTS=5                  # Number of top objects to show
GIT_SIZER_OPTS="--verbose"         # git-sizer options
NUMFMT_PATH="/usr/bin/numfmt"      # Path to numfmt
COLUMN_PATH="/usr/bin/column"      # Path to column

# Color Definitions
COLOR_RESET="\033[0m"
COLOR_BOLD="\033[1m"
COLOR_RED="\033[31m"
COLOR_YELLOW="\033[33m"
COLOR_CYAN="\033[36m"
COLOR_WHITE="\033[37m"
COLOR_GREEN="\033[32m"

# ---------------------------------------------------------------------------
# Do NOT modify below this line unless you know what you're doing
# ---------------------------------------------------------------------------



find_large_objects() {
    local size_limit="${1:-$DEFAULT_SIZE_LIMIT}"
    local compact_output=false

    # Parse command-line options
    while getopts ":s:chv" opt; do
        case $opt in
            s) size_limit="$OPTARG" ;;
            c) compact_output=true ;;
            v) GIT_SIZER_OPTS+=" --progress" ;;
            h) show_help; return 0 ;;
            \?) echo -e "${COLOR_RED}Invalid option: -$OPTARG${COLOR_RESET}" >&2; return 1 ;;
        esac
    done

    # Check dependencies
    if $CHECK_DEPENDENCIES; then
        check_dependencies || return 1
    fi

    # Validate size format
    if ! validate_size_format "$size_limit"; then
        echo -e "${COLOR_RED}Invalid size format: $size_limit${COLOR_RESET}"
        echo "Valid formats: 500K, 100M, 2G, etc."
        return 1
    fi

    # Convert size to bytes for comparison
    local size_bytes
    size_bytes=$(convert_to_bytes "$size_limit") || return 1

    # Header
    echo -e "${COLOR_BOLD}${COLOR_CYAN}=== Large Object Analysis (≥ $size_limit) ===${COLOR_RESET}"

    # Show summary section
    if $SHOW_SUMMARY; then
        echo -e "\n${COLOR_BOLD}${COLOR_YELLOW}📦 Repository Summary:${COLOR_RESET}"
        git-sizer $GIT_SIZER_OPTS | grep -A $NUM_TOP_OBJECTS "Biggest objects"
    fi

    # Show detailed files
    if $SHOW_DETAILS; then
        echo -e "\n${COLOR_BOLD}${COLOR_YELLOW}🔍 Detailed Large Files:${COLOR_RESET}"
        find_large_files "$size_bytes" "$compact_output"
    fi
}

# Helper functions
show_help() {
    echo "Usage: find_large_objects [-s size] [-c] [-h] [-v]"
    echo "Options:"
    echo "  -s  Size limit (default: $DEFAULT_SIZE_LIMIT)"
    echo "  -c  Compact output mode"
    echo "  -v  Verbose mode (show progress)"
    echo "  -h  Show this help message"
}

check_dependencies() {
    local missing=()
    for cmd in git "$NUMFMT_PATH" "$COLUMN_PATH" git-sizer; do
        if ! command -v "$cmd" &> /dev/null; then
            missing+=("$cmd")
        fi
    done

    if [ ${#missing[@]} -gt 0 ]; then
        echo -e "${COLOR_RED}Missing dependencies:${COLOR_RESET}"
        for dep in "${missing[@]}"; do
            echo " - $dep"
        done
        return 1
    fi
}

validate_size_format() {
    [[ "$1" =~ ^[0-9]+[KMG]?$ ]] || return 1
}

convert_to_bytes() {
    local size=$1
    echo "$size" | $NUMFMT_PATH --from=iec 2>/dev/null || {
        echo -e "${COLOR_RED}Invalid size format: $size${COLOR_RESET}";
        return 1;
    }
}

find_large_files() {
    local size_bytes=$1
    local compact=$2

    git rev-list --objects --all |
    git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
    awk -v limit="$size_bytes" -v compact="$compact" '
        $3 >= limit {
            count++
            total += $3
            # Store objects for later sorting
            objects[count] = $0
        }
        END {
            if (count == 0) {
                print "No files found exceeding the size limit"
                exit 0
            }
            # Sort objects by size descending
            for (i=1; i<=count; i++) {
                for (j=i+1; j<=count; j++) {
                    split(objects[i], parts_i, " ")
                    split(objects[j], parts_j, " ")
                    if (parts_j[3] > parts_i[3]) {
                        temp = objects[i]
                        objects[i] = objects[j]
                        objects[j] = temp
                    }
                }
            }
            # Print sorted results
            for (i=1; i<=count; i++) {
                print objects[i]
            }
            # Print summary unless in compact mode
            if (!compact) {
                print "\nTotal large files: " count
                printf "Total size: %.2f MB\n", total/1048576
            }
        }' |
    $NUMFMT_PATH --field=3 --to=iec |
    $COLUMN_PATH -t
}

# Main execution
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    find_large_objects "$@"
fi