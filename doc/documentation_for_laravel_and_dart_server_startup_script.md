Here's the updated documentation for your script:

---

# Documentation for Laravel and Dart Server Startup Script

## Overview
This Bash script automates the setup of a Laravel server and Dart application by performing the following tasks:
1. Pulls the latest changes from the Git repositories of the Laravel and Dart projects.
2. Obtains the active IP address of a specific network interface.
3. Starts the Laravel server and queue worker.
4. Updates the base URL in the Dart configuration file to reflect the current IP address.
5. Launches the Laravel Telescope in Google Chrome.

## Prerequisites
- Ensure that `git`, `php`, and `google-chrome` are installed on your system.
- The script assumes that the Laravel application is set up to run with `php artisan serve`.
- The Dart project must have a configuration file that specifies a `baseUrl`.

## Configuration Variables
The following configuration variables are defined at the beginning of the script:

```bash
LARAVEL_PROJECT_PATH="/home/j/live/todo-app" # Path to your Laravel project
DART_PROJECT_PATH="/home/j/live/scaibutodoapp" # Path to your Dart project
CONFIG_FILE_PATH="$DART_PROJECT_PATH/lib/core/network/network_config.dart" # Path to the Dart config file
CHROME_COMMAND="google-chrome" # Command to launch Chrome
```

- **`LARAVEL_PROJECT_PATH`**: Specifies the path to the Laravel project directory.
- **`DART_PROJECT_PATH`**: Specifies the path to the Dart project directory.
- **`CONFIG_FILE_PATH`**: Specifies the path to the Dart configuration file where the base URL is defined.
- **`CHROME_COMMAND`**: Specifies the command used to launch Google Chrome.

## Functions

### 1. `get_active_ip_address()`
This function retrieves the active IP address of the specified network interface (`enx` or `enp`).

#### Implementation:
```bash
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
```

### 2. `start_laravel_server()`
This function starts the Laravel development server using the active IP address.

#### Parameters:
- `ip_address`: The IP address to bind the server to.

#### Implementation:
```bash
start_laravel_server() {
  locals ip_address="$1"
  echo "Starting Laravel server on IP: $ip_address"
  cd "$LARAVEL_PROJECT_PATH" || exit
  php artisan serve --host="$ip_address" &
}
```

### 3. `start_queue_worker()`
This function starts the Laravel queue worker.

#### Implementation:
```bash
start_queue_worker() {
  echo "Starting Laravel queue worker"
  php artisan queue:work &
}
```

### 4. `update_base_url()`
This function updates the `baseUrl` in the Dart configuration file to match the current IP address.

#### Parameters:
- `ip_address`: The active IP address to be set as the new base URL.

#### Implementation:
```bash
update_base_url() {
  locals ip_address="$1"
  locals new_base_url="http://$ip_address:8000/"

  if [ -f "$CONFIG_FILE_PATH" ]; then
    echo "Updating baseUrl in $CONFIG_FILE_PATH to $new_base_url"
    sed -i "s|const baseUrl = 'http://.*:8000/';|const baseUrl = '$new_base_url';|" "$CONFIG_FILE_PATH"
  else
    echo "Config file not found: $CONFIG_FILE_PATH"
    exit 1
  fi
}
```

### 5. `launch_telescope_url()`
This function launches the Laravel Telescope interface in Google Chrome.

#### Parameters:
- `ip_address`: The active IP address to construct the Telescope URL.

#### Implementation:
```bash
launch_telescope_url() {
  locals ip_address="$1"
  locals telescope_url="http://$ip_address:8000/telescope/requests"
  echo "Launching Telescope URL: $telescope_url"
  $CHROME_COMMAND --new-tab "$telescope_url" &>/dev/null &
}
```

### 6. `git_pull()`
This function pulls the latest changes from the Git repository for the specified project path.

#### Parameters:
- `project_path`: The path of the project directory to update.

#### Implementation:
```bash
git_pull() {
  locals project_path="$1"
  echo "Pulling latest changes in $project_path"
  cd "$project_path" || exit
  git pull
}
```

## Main Script Execution
The main execution block of the script performs the following:
1. Calls `git_pull` for both the Laravel and Dart project paths to ensure they are up-to-date.
2. Calls `get_active_ip_address` to retrieve the current active IP address.
3. If an IP address is found:
   - Starts the Laravel server with `start_laravel_server`.
   - Starts the Laravel queue worker with `start_queue_worker`.
   - Updates the Dart configuration file's base URL with `update_base_url`.
   - Launches the Telescope URL in Chrome with `launch_telescope_url`.
4. If no IP address is found, it prints an error message and exits.

#### Main Execution Code:
```bash
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
```

## Usage
To use this script:
1. Save the script to a file, e.g., `start_server.sh`.
2. Make the script executable:
   ```bash
   chmod +x start_server.sh
   ```
3. Run the script:
   ```bash
   ./start_server.sh
   ```

## Conclusion
This script simplifies the process of starting a Laravel server and Dart application while ensuring that the configuration reflects the current network settings. By automating the Git pulls and server startup, it enhances productivity during development.

---