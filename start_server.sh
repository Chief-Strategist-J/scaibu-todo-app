#!/bin/bash

# Configuration Variables
LARAVEL_PROJECT_PATH="/home/j/live/todo-app" # Path to your Laravel project
DART_PROJECT_PATH="/home/j/live/scaibutodoapp" # Path to your Dart project
CONFIG_FILE_PATH="$DART_PROJECT_PATH/lib/core/network/network_config.dart" # Path to the Dart config file
CHROME_COMMAND="google-chrome" # Command to launch Chrome

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

# Function to launch the Telescope URL in Chrome
launch_telescope_url() {
  local ip_address="$1"
  local telescope_url="http://$ip_address:8000/telescope/requests"
  echo "Launching Telescope URL: $telescope_url"
  $CHROME_COMMAND --new-tab "$telescope_url" &>/dev/null &
}

# Function to pull the latest changes from Git
git_pull() {
  local project_path="$1"
  echo "Pulling latest changes in $project_path"
  cd "$project_path" || exit
  git pull
}

# Main Script Execution
git_pull "$LARAVEL_PROJECT_PATH"
git_pull "$DART_PROJECT_PATH"

ip_address=$(get_active_ip_address)

if [ -n "$ip_address" ]; then
  start_laravel_server "$ip_address"
  start_queue_worker
  update_base_url "$ip_address"
  launch_telescope_url "$ip_address"
else
  echo "IP address not found. Please check your network interface."
  exit 1
fi
