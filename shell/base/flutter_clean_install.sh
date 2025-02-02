#!/bin/bash

# Set the Flutter project path here
FLUTTER_PROJECT_PATH="/home/j/live/scaibutodoapp"

# Function to clean Flutter dependencies, reinstall them, and upgrade to stable
flutter_clean_install() {
  # Check if the Flutter project path is provided
  if [ -z "$FLUTTER_PROJECT_PATH" ]; then
    echo "Error: No Flutter project path provided in the variable."
    echo "Please update the FLUTTER_PROJECT_PATH variable."
    exit 1
  fi

  # Navigate to the Flutter project directory
  if cd "$FLUTTER_PROJECT_PATH"; then
    echo "Navigated to Flutter project directory: $FLUTTER_PROJECT_PATH"
  else
    echo "Error: Could not navigate to directory $FLUTTER_PROJECT_PATH"
    exit 1
  fi

  # Ask for confirmation before clearing the cache
  read -p "Do you want to clear Flutter's cache? (y/n): " CLEAR_CACHE
  if [[ "$CLEAR_CACHE" =~ ^[Yy]$ ]]; then
    echo "Clearing Flutter cache..."
    flutter pub cache clear
  else
    echo "Skipping cache clearing."
  fi

  # Clean the project dependencies
  echo "Cleaning Flutter project..."
  flutter clean

  # Reinstall dependencies
  echo "Reinstalling dependencies..."
  flutter pub get

  # Ask for confirmation before upgrading to the stable version
  read -p "Do you want to upgrade Flutter to the stable version? (y/n): " CONFIRMATION
  if [[ "$CONFIRMATION" =~ ^[Yy]$ ]]; then
    # Switch to the stable Flutter channel
    echo "Switching to Flutter stable channel..."
    flutter channel stable

    # Upgrade Flutter to the latest stable version
    echo "Upgrading Flutter to the latest stable version..."
    flutter upgrade
  else
    echo "Skipping Flutter upgrade."
  fi

  # Run Flutter doctor to check the setup
  echo "Running flutter doctor to verify installation..."
  flutter doctor
}

# Call the function
flutter_clean_install
