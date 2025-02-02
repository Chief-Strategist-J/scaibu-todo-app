#!/usr/bin/env bash

# Configuration Section - Edit these values as needed
DEFAULT_BRANCH=""                  # Leave empty to use current branch
DEFAULT_TOP_FILES=5                # Number of top modified files to show
USE_COLOR=true                     # Enable/disable colored output
COMPACT_OUTPUT=false               # Default compact mode state
CHECK_UNMERGED=true                # Check for unmerged branches
VALIDATE_BRANCH=true               # Verify branch existence
MAX_CONTRIBUTORS=5                 # Number of top contributors to show
ACTIVE_HOURS=5                     # Number of active commit hours to show

# Color Definitions (only used when USE_COLOR=true)
COLOR_RESET="\033[0m"
COLOR_BOLD="\033[1m"
COLOR_CYAN="\033[36m"
COLOR_YELLOW="\033[33m"
COLOR_GREEN="\033[32m"
COLOR_RED="\033[31m"
COLOR_WHITE="\033[37m"

# ---------------------------------------------------------------------------
# Do NOT modify below this line unless you know what you're doing
# ---------------------------------------------------------------------------

analyze_branch() {
    local branch="${1:-${DEFAULT_BRANCH}}"
    branch="${branch:-$(git rev-parse --abbrev-ref HEAD)}"

    # Parse command-line options
    local top_files=$DEFAULT_TOP_FILES
    local compact_output=$COMPACT_OUTPUT
    local use_color=$USE_COLOR

    while getopts ":b:n:ch" opt; do
        case $opt in
            b) branch="$OPTARG" ;;
            n) top_files="$OPTARG" ;;
            c) compact_output=true ;;
            h) show_help; return 0 ;;
            \?) echo -e "${COLOR_RED}Invalid option: -$OPTARG${COLOR_RESET}" >&2; return 1 ;;
        esac
    done

    # Validate numeric arguments
    if ! [[ "$top_files" =~ ^[0-9]+$ ]]; then
        echo -e "${COLOR_RED}Error: -n requires numeric argument${COLOR_RESET}" >&2
        return 1
    fi

    # Check branch existence
    if $VALIDATE_BRANCH && ! git rev-parse --verify --quiet "$branch" >/dev/null; then
        echo -e "${COLOR_RED}Error: Branch '$branch' does not exist!${COLOR_RESET}" >&2
        return 1
    fi

    # Header
    if $use_color; then
        echo -e "${COLOR_BOLD}${COLOR_CYAN}=== Branch Analysis for ${COLOR_WHITE}$branch ${COLOR_CYAN}===${COLOR_RESET}"
    else
        echo "=== Branch Analysis for $branch ==="
    fi

    # Core analysis logic
    local total_commits=$(git rev-list --count "$branch")
    local total_authors=$(git shortlog -sn "$branch" | wc -l)
    local line_stats=$(git log --numstat --pretty="%H" "$branch" | awk 'NF==3 {add+=$1; del+=$2} END {print add, del}')
    local file_stats=$(git log --pretty=format: --name-only "$branch" | sort | uniq -c | sort -rn)
    local total_files=$(echo "$file_stats" | wc -l)
    local average_files=$(echo "$file_stats" | awk '{ total += $1 } END { printf "%.1f", total/NR }')

    # Display results
    if ! $compact_output; then
        show_basic_stats "$total_commits" "$total_authors" "$total_files" "$average_files" "$line_stats"
        show_contributors "$MAX_CONTRIBUTORS"
        show_commit_times "$ACTIVE_HOURS"
    fi

    show_top_files "$top_files" "$file_stats"

    if $CHECK_UNMERGED; then
        check_unmerged_branches "$branch"
    fi
}

# Helper functions
show_help() {
    echo "Usage: analyze_branch [-b branch] [-n number] [-c] [-h]"
    echo "Options:"
    echo "  -b  Specify branch name (default: current)"
    echo "  -n  Number of top files to show (default: $DEFAULT_TOP_FILES)"
    echo "  -c  Compact output mode"
    echo "  -h  Show this help message"
}

show_basic_stats() {
    if $use_color; then
        echo -e "\n${COLOR_BOLD}${COLOR_YELLOW}📊 Basic Statistics:${COLOR_RESET}"
        echo -e "Total commits: ${COLOR_GREEN}$1${COLOR_RESET}"
        echo -e "Total contributors: ${COLOR_GREEN}$2${COLOR_RESET}"
        echo -e "Total files modified: ${COLOR_GREEN}$3${COLOR_RESET}"
        echo -e "Average files per commit: ${COLOR_GREEN}$4${COLOR_RESET}"
        echo -e "Lines added: ${COLOR_GREEN}$(echo $5 | cut -d' ' -f1)${COLOR_RESET}"
        echo -e "Lines removed: ${COLOR_GREEN}$(echo $5 | cut -d' ' -f2)${COLOR_RESET}"
    else
        echo -e "\n📊 Basic Statistics:"
        echo "Total commits: $1"
        echo "Total contributors: $2"
        echo "Total files modified: $3"
        echo "Average files per commit: $4"
        echo "Lines added: $(echo $5 | cut -d' ' -f1)"
        echo "Lines removed: $(echo $5 | cut -d' ' -f2)"
    fi
}

show_top_files() {
    if $use_color; then
        echo -e "\n${COLOR_BOLD}${COLOR_YELLOW}📌 Top Modified Files:${COLOR_RESET}"
    else
        echo -e "\n📌 Top Modified Files:"
    fi
    echo "$2" | head -n "$1" | awk '{printf "%-6s %s\n", $1, $2}'
}

show_contributors() {
    local contributors=$(git shortlog -sn "$branch" | head -n "$1")
    if $use_color; then
        echo -e "\n${COLOR_BOLD}${COLOR_YELLOW}👥 Top Contributors:${COLOR_RESET}"
    else
        echo -e "\n👥 Top Contributors:"
    fi
    echo "$contributors" | awk '{printf "%-6s %s\n", $1, $2}'
}

show_commit_times() {
    local commit_times=$(git log --pretty=format:%ad --date=format-local:%H "$branch" | sort | uniq -c | sort -rn | head -n "$1")
    if $use_color; then
        echo -e "\n${COLOR_BOLD}${COLOR_YELLOW}⏰ Most Active Commit Times:${COLOR_RESET}"
    else
        echo -e "\n⏰ Most Active Commit Times:"
    fi
    echo "$commit_times" | awk '{printf "%02d:00 - %4s commits\n", $2, $1}'
}

check_unmerged_branches() {
    local unmerged=$(git branch --no-merged "$1" | wc -l)
    if [ "$unmerged" -gt 0 ]; then
        if $use_color; then
            echo -e "\n${COLOR_BOLD}${COLOR_RED}⚠️  Warning: $unmerged branches not merged into $1${COLOR_RESET}"
        else
            echo -e "\n⚠️  Warning: $unmerged branches not merged into $1"
        fi
    fi
}

# Main execution
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    analyze_branch "$@"
fi