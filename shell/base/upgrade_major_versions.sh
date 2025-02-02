#!/bin/bash

# --- Configuration Section ---
# Set the directory of your Flutter project
PROJECT_DIR="/home/j/live/scaibutodoapp"

# Set the backup directory for pubspec.yaml backups
BACKUP_DIR="/home/j/live/scaibutodoapp/backup"

# --- End of Configuration Section ---

# Function to create a backup of pubspec.yaml
backup_pubspec() {
    local project_dir="$1"
    local backup_dir="$2"
    local timestamp
    timestamp=$(date +%Y%m%d%H%M%S)
    local backup_name="pubspec_backup_$timestamp.yaml"

    echo "Creating backup of pubspec.yaml..."
    cp "$project_dir/pubspec.yaml" "$backup_dir/$backup_name"

    if [ $? -eq 0 ]; then
        echo "Backup successfully created at $backup_dir/$backup_name"
    else
        echo "Backup failed. Exiting..."
        exit 1
    fi
}

# Function to update Flutter packages (including major version upgrades)
update_packages() {
    local project_dir="$1"

    echo "Navigating to project directory: $project_dir"
    cd "$project_dir" || { echo "Project directory not found! Exiting..."; exit 1; }

    echo "Updating Flutter packages with major version upgrades..."
    flutter pub upgrade --major-versions

    if [ $? -eq 0 ]; then
        echo "Packages successfully updated!"
    else
        echo "Package update failed."
        exit 1
    fi
}

# Main script execution
main() {
    # Ensure the project directory and backup directory exist
    if [ ! -d "$PROJECT_DIR" ]; then
        echo "Project directory does not exist. Exiting..."
        exit 1
    fi

    if [ ! -d "$BACKUP_DIR" ]; then
        echo "Backup directory does not exist. Exiting..."
        exit 1
    fi

    # Create backup of pubspec.yaml and then update packages
    backup_pubspec "$PROJECT_DIR" "$BACKUP_DIR"
    update_packages "$PROJECT_DIR"
}

# Run the main function
main
