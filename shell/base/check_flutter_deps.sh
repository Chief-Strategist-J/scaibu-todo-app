#!/bin/bash

# Define global variables
DEPENDENCY="open_filex"
BASE_DIR="/home/j/live/scaibu-todo-app/shell/base"
LOGS_DIR="$BASE_DIR/treeLogs"
DATE_SUFFIX="$(date +%Y-%m-%d_%H-%M-%S)"
DEPS_FILE="$LOGS_DIR/${DATE_SUFFIX}_deps_tree.log"
FLUTTER_LOG="$LOGS_DIR/${DATE_SUFFIX}_flutter_pub_get.log"
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
DEFAULT_PROJECT_DIR="/home/j/live/scaibu-todo-app"
PROJECT_DIR="${1:-$DEFAULT_PROJECT_DIR}"

# Ensure Flutter command exists
FLUTTER_CMD="flutter"

# Function to create necessary directories
create_directories() {
    if [ ! -d "$LOGS_DIR" ]; then
        mkdir -p "$LOGS_DIR"
        if [ $? -ne 0 ]; then
            echo -e "${RED}Error: Failed to create directory $LOGS_DIR${NC}"
            exit 1
        fi
    fi
}

# Function to check if Flutter is installed
check_flutter_installed() {
    if ! type flutter >/dev/null 2>&1; then
        echo -e "${RED}Error: Flutter is not found in PATH${NC}"
        exit 1
    fi
}

# Function to validate the project directory
validate_project_directory() {
    if [ ! -f "$PROJECT_DIR/pubspec.yaml" ]; then
        echo -e "${RED}Error: pubspec.yaml not found in $PROJECT_DIR. Are you in a Flutter project directory?${NC}"
        exit 1
    fi
}

# Function to generate the header
generate_header() {
    {
        echo "Flutter Project Dependency Tree"
        echo "Generated on: $(date)"
        echo "Project: $PROJECT_DIR"
        echo "----------------------------------------"
        echo ""
    } >> "$DEPS_FILE"
}

# Function to fetch dependency tree
fetch_dependency_tree() {
    echo "Generating dependency tree in: $DEPS_FILE"
    cd "$PROJECT_DIR" || exit 1

    # Ensure the file is properly handled
    : > "$DEPS_FILE" || { echo -e "${RED}Error: Cannot write to $DEPS_FILE${NC}"; exit 1; }

    {
        echo "Complete Dependency Tree:"
        echo "----------------------------------------"
        cd "$PROJECT_DIR" && flutter pub deps | tee "$DEPS_FILE"
        echo ""
    } || { echo -e "${RED}Error: Write failed!${NC}"; exit 1; }

    if [ ! -s "$DEPS_FILE" ]; then
        echo -e "${RED}Error: Failed to generate dependency tree!${NC}"
        exit 1
    else
        echo -e "${GREEN}Successfully generated dependency tree at: $DEPS_FILE${NC}"
    fi
}

# Function to search for the dependency
search_dependency() {
    if [ -f "$DEPS_FILE" ]; then
        echo -e "${GREEN}Checking for package: $DEPENDENCY${NC}"
        if grep -i "$DEPENDENCY" "$DEPS_FILE"; then
            echo -e "${GREEN}Found dependency references above.${NC}"
        else
            echo -e "${RED}No references found for $DEPENDENCY. Fetching complete dependency tree...${NC}"
            fetch_dependency_tree
        fi
    fi
}

# Main execution flow
create_directories
check_flutter_installed
validate_project_directory
fetch_dependency_tree
search_dependency
