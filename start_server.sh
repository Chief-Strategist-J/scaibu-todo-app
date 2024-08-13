#!/bin/bash

# Configuration Variables
LARAVEL_PROJECT_PATH="/home/j/live/todo-app" # Path to your Laravel project
DART_PROJECT_PATH="/home/j/live/scaibutodoapp" # Path to your Dart project
CONFIG_FILE_PATH="$DART_PROJECT_PATH/lib/core/network/network_config.dart" # Path to the Dart config file
FLUTTER_SDK_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.0-stable.tar.xz" # Flutter SDK download URL
FLUTTER_INSTALL_DIR="$HOME/flutter" # Directory to install Flutter SDK

# Function to get the active IP address of the specific interface
get_active_ip_address() {
  ip addr show | grep -E '^[0-9]+: enx|^[0-9]+: enp' | while read -r line; do
    interface=$(echo "$line" | cut -d: -f2 | xargs)
    ip_address=$(ip addr show "$interface" | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
    if [ -n "$ip_address" ]; then
      echo "$ip_address"
      return
    fi
  done
}

# Function to start the Laravel server
start_laravel_server() {
  local ip_address="$1"
  echo "Starting Laravel server on IP: $ip_address"
  cd "$LARAVEL_PROJECT_PATH" || exit
  php artisan serve --host="$ip_address" &
}

# Function to start the Laravel queue worker
start_queue_worker() {
  echo "Starting Laravel queue worker"
  php artisan queue:work &
}

# Function to update the baseUrl in the Dart config file
update_base_url() {
  local ip_address="$1"
  local new_base_url="http://$ip_address:8000/"

  if [ -f "$CONFIG_FILE_PATH" ]; then
    echo "Updating baseUrl in $CONFIG_FILE_PATH to $new_base_url"
    sed -i "s|const baseUrl = 'http://.*:8000/';|const baseUrl = '$new_base_url';|" "$CONFIG_FILE_PATH"
  else
    echo "Config file not found: $CONFIG_FILE_PATH"
    exit 1
  fi
}

# Function to pull the latest changes from Git
git_pull() {
  local project_path="$1"
  echo "Pulling latest changes in $project_path"
  cd "$project_path" || exit
  git pull
}

# Function to download and install Flutter SDK
install_flutter() {
  echo "Downloading Flutter SDK..."
  mkdir -p "$FLUTTER_INSTALL_DIR"
  wget "$FLUTTER_SDK_URL" -O "$FLUTTER_INSTALL_DIR/flutter.tar.xz"

  echo "Extracting Flutter SDK..."
  tar xf "$FLUTTER_INSTALL_DIR/flutter.tar.xz" -C "$FLUTTER_INSTALL_DIR"
  export PATH="$FLUTTER_INSTALL_DIR/flutter/bin:$PATH"

  echo "Flutter SDK installed successfully."
}

# Function to clean and update Flutter packages
update_flutter_packages() {
  echo "Cleaning Flutter project in $DART_PROJECT_PATH"
  cd "$DART_PROJECT_PATH" || exit

  if command -v flutter &> /dev/null; then
    flutter clean
    echo "Updating Flutter packages in $DART_PROJECT_PATH"
    flutter pub get
  else
    echo "Flutter not found, attempting to install..."
    install_flutter

    # After installation, run the Flutter commands
    flutter clean
    echo "Updating Flutter packages in $DART_PROJECT_PATH"
    flutter pub get
  fi
}

# Main Script Execution
git_pull "$LARAVEL_PROJECT_PATH"
git_pull "$DART_PROJECT_PATH"

# Clean and update Flutter packages
update_flutter_packages

ip_address=$(get_active_ip_address)

if [ -n "$ip_address" ]; then
  start_laravel_server "$ip_address"
  start_queue_worker
  update_base_url "$ip_address"
  echo "Launching Telescope URL: http://$ip_address:8000/telescope/requests"
else
  echo "IP address not found. Please check your network interface."
  exit 1
fi
