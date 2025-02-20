#!/bin/bash
# =====================================================
# UNIVERSAL JAVA VERSION MANAGER FOR FLUTTER PROJECTS
# =====================================================

# Force bash if script is run with sh
if [ -z "$BASH_VERSION" ]; then
  exec bash "$0" "$@"
  exit $?
fi

# --------------------- CONFIGURATION ---------------------
# Supported Java versions with their package names and paths
unset JAVA_VERSIONS
declare -A JAVA_VERSIONS
JAVA_VERSIONS["8"]="openjdk-8-jdk:/usr/lib/jvm/java-8-openjdk-amd64"
JAVA_VERSIONS["11"]="openjdk-11-jdk:/usr/lib/jvm/java-11-openjdk-amd64"
JAVA_VERSIONS["17"]="openjdk-17-jdk:/usr/lib/jvm/java-17-openjdk-amd64"
JAVA_VERSIONS["21"]="openjdk-21-jdk:/usr/lib/jvm/java-21-openjdk-amd64"

# Default settings
DEFAULT_JAVA_VERSION="17"
GRADLE_DISTRIBUTION_URL="https://services.gradle.org/distributions/gradle-7.6-all.zip"
LOG_FILE="java_switcher.log"

# Project paths
GRADLE_PROPERTIES_PATH="android/gradle.properties"
WRAPPER_PROPERTIES_PATH="android/gradle/wrapper/gradle-wrapper.properties"
BUILD_GRADLE_PATH="android/build.gradle"

# System detection
PACKAGE_MANAGER=""
OS_TYPE=""

# --------------------- UTILITY FUNCTIONS ---------------------

detect_system() {
  # Detect OS type
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS_TYPE="$ID"
  elif [ -f /etc/debian_version ]; then
    OS_TYPE="debian"
  elif [ -f /etc/redhat-release ]; then
    OS_TYPE="rhel"
  elif [ "$(uname)" = "Darwin" ]; then
    OS_TYPE="macos"
  else
    OS_TYPE="unknown"
  fi

  # Detect package manager
  if command -v apt-get >/dev/null 2>&1; then
    PACKAGE_MANAGER="apt"
  elif command -v dnf >/dev/null 2>&1; then
    PACKAGE_MANAGER="dnf"
  elif command -v yum >/dev/null 2>&1; then
    PACKAGE_MANAGER="yum"
  elif command -v brew >/dev/null 2>&1; then
    PACKAGE_MANAGER="brew"
  else
    PACKAGE_MANAGER="unknown"
  fi

  # Adjust Java paths based on OS
  if [ "$OS_TYPE" = "macos" ]; then
    JAVA_VERSIONS["8"]="openjdk@8:/usr/local/opt/openjdk@8"
    JAVA_VERSIONS["11"]="openjdk@11:/usr/local/opt/openjdk@11"
    JAVA_VERSIONS["17"]="openjdk@17:/usr/local/opt/openjdk@17"
    JAVA_VERSIONS["21"]="openjdk@21:/usr/local/opt/openjdk@21"
  elif [ "$OS_TYPE" = "fedora" ] || [ "$OS_TYPE" = "rhel" ] || [ "$OS_TYPE" = "centos" ]; then
    JAVA_VERSIONS["8"]="java-1.8.0-openjdk-devel:/usr/lib/jvm/java-1.8.0-openjdk"
    JAVA_VERSIONS["11"]="java-11-openjdk-devel:/usr/lib/jvm/java-11-openjdk"
    JAVA_VERSIONS["17"]="java-17-openjdk-devel:/usr/lib/jvm/java-17-openjdk"
    JAVA_VERSIONS["21"]="java-21-openjdk-devel:/usr/lib/jvm/java-21-openjdk"
  fi
}

log() {
  local level=$1
  local message=$2
  local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
  echo "[$timestamp] [$level] $message" | tee -a "$LOG_FILE"
}

log_info() {
  log "INFO" "$1"
}

log_error() {
  log "ERROR" "$1" >&2
}

log_success() {
  log "SUCCESS" "$1"
}

is_installed() {
  command -v "$1" >/dev/null 2>&1
  return $?
}

check_sudo_access() {
  if ! is_installed sudo; then
    log_error "sudo is not available. Cannot perform installation."
    return 1
  fi

  # Check if we have sudo access without a password or with cached credentials
  if sudo -n true 2>/dev/null; then
    return 0
  else
    log_info "Sudo access required for installation. You may be prompted for your password."
    if sudo true; then
      return 0
    else
      log_error "Failed to get sudo access."
      return 1
    fi
  fi
}

backup_file() {
  local file="$1"
  if [ -f "$file" ]; then
    cp "$file" "${file}.backup.$(date +%Y%m%d%H%M%S)"
    log_info "Created backup of $file"
  fi
}

# --------------------- JAVA MANAGEMENT FUNCTIONS ---------------------

get_java_versions() {
  # Returns array of all keys (java versions)
  echo "${!JAVA_VERSIONS[@]}"
}

install_java_version() {
  local version=$1
  local package_info=${JAVA_VERSIONS[$version]}

  if [ -z "$package_info" ]; then
    log_error "Unknown Java version: $version"
    return 1
  fi

  local package_name="${package_info%%:*}"

  log_info "Checking if Java $version is already installed..."

  # Check based on OS
  case "$PACKAGE_MANAGER" in
    apt)
      if dpkg -l | grep -q "$package_name"; then
        log_info "Java $version is already installed."
        return 0
      fi

      if ! check_sudo_access; then
        return 1
      fi

      log_info "Installing Java $version ($package_name)..."
      if sudo apt update && sudo apt install -y "$package_name"; then
        log_success "Successfully installed Java $version"
        return 0
      fi
      ;;

    dnf|yum)
      if rpm -q "$package_name" >/dev/null 2>&1; then
        log_info "Java $version is already installed."
        return 0
      fi

      if ! check_sudo_access; then
        return 1
      fi

      log_info "Installing Java $version ($package_name)..."
      if sudo $PACKAGE_MANAGER install -y "$package_name"; then
        log_success "Successfully installed Java $version"
        return 0
      fi
      ;;

    brew)
      if brew list | grep -q "$package_name"; then
        log_info "Java $version is already installed."
        return 0
      fi

      log_info "Installing Java $version ($package_name)..."
      if brew install "$package_name"; then
        log_success "Successfully installed Java $version"
        return 0
      fi
      ;;

    *)
      log_error "Unsupported package manager: $PACKAGE_MANAGER"
      log_info "Please install Java $version manually"
      return 1
      ;;
  esac

  log_error "Failed to install Java $version"
  return 1
}

get_java_path() {
  local version=$1
  local package_info=${JAVA_VERSIONS[$version]}

  if [ -z "$package_info" ]; then
    log_error "Unknown Java version: $version"
    return 1
  fi

  echo "${package_info#*:}"
}

validate_java_installation() {
  local java_home=$1
  local version=$2

  if [ ! -d "$java_home" ]; then
    # Try to find Java home on the system
    if [ "$OS_TYPE" = "macos" ]; then
      java_home=$(/usr/libexec/java_home -v "$version" 2>/dev/null)
      if [ -n "$java_home" ]; then
        log_info "Found Java $version at $java_home"
        echo "$java_home"
        return 0
      fi
    elif [ -d "/usr/lib/jvm" ]; then
      # Try to find Java directory on Linux systems
      for dir in /usr/lib/jvm/java-*-openjdk*; do
        if [ -x "$dir/bin/java" ]; then
          java_version=$("$dir/bin/java" -version 2>&1 | head -1 | cut -d'"' -f2 | cut -d'.' -f1)
          if [ "$java_version" = "$version" ]; then
            log_info "Found Java $version at $dir"
            echo "$dir"
            return 0
          fi
        fi
      done
    fi

    log_error "Java directory not found: $java_home"
    log_info "Please specify the correct path to Java $version or install it"
    return 1
  fi

  if [ ! -x "$java_home/bin/java" ]; then
    log_error "Java executable not found in $java_home/bin"
    return 1
  fi

  log_success "Validated Java $version installation at $java_home"
  return 0
}

show_current_java() {
  echo "------------------------------------"
  echo "Current Java Configuration:"
  echo "------------------------------------"
  echo "JAVA_HOME: $JAVA_HOME"
  echo ""
  echo "Java version:"
  java -version 2>&1 | sed 's/^/  /'
  echo "------------------------------------"
}

# --------------------- PROJECT CONFIGURATION FUNCTIONS ---------------------

create_directories() {
  local dir=$(dirname "$GRADLE_PROPERTIES_PATH")
  if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
    log_info "Created directory: $dir"
  fi

  dir=$(dirname "$WRAPPER_PROPERTIES_PATH")
  if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
    log_info "Created directory: $dir"
  fi
}

update_gradle_properties() {
  create_directories

  # Create the file if it doesn't exist
  if [ ! -f "$GRADLE_PROPERTIES_PATH" ]; then
    touch "$GRADLE_PROPERTIES_PATH"
    log_info "Created new gradle.properties file"
  else
    backup_file "$GRADLE_PROPERTIES_PATH"
  fi

  # Update Java home path
  if grep -q "org.gradle.java.home" "$GRADLE_PROPERTIES_PATH"; then
    sed -i.bak "s|org.gradle.java.home=.*|org.gradle.java.home=$JAVA_HOME|g" "$GRADLE_PROPERTIES_PATH"
    rm -f "${GRADLE_PROPERTIES_PATH}.bak"
  else
    echo "org.gradle.java.home=$JAVA_HOME" >> "$GRADLE_PROPERTIES_PATH"
  fi

  # Add other useful Gradle settings if they don't exist
  if ! grep -q "org.gradle.parallel" "$GRADLE_PROPERTIES_PATH"; then
    echo "org.gradle.parallel=true" >> "$GRADLE_PROPERTIES_PATH"
  fi

  if ! grep -q "org.gradle.caching" "$GRADLE_PROPERTIES_PATH"; then
    echo "org.gradle.caching=true" >> "$GRADLE_PROPERTIES_PATH"
  fi

  if ! grep -q "org.gradle.jvmargs" "$GRADLE_PROPERTIES_PATH"; then
    echo "org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8" >> "$GRADLE_PROPERTIES_PATH"
  fi

  log_success "Updated Gradle properties at $GRADLE_PROPERTIES_PATH"
}

update_gradle_wrapper() {
  create_directories

  # Create the file if it doesn't exist
  if [ ! -f "$WRAPPER_PROPERTIES_PATH" ]; then
    cat > "$WRAPPER_PROPERTIES_PATH" << EOF
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
distributionUrl=$GRADLE_DISTRIBUTION_URL
EOF
    log_success "Created new gradle-wrapper.properties file"
  else
    backup_file "$WRAPPER_PROPERTIES_PATH"
    # Update just the distribution URL
    if grep -q "distributionUrl" "$WRAPPER_PROPERTIES_PATH"; then
      sed -i.bak "s|distributionUrl=.*|distributionUrl=$GRADLE_DISTRIBUTION_URL|g" "$WRAPPER_PROPERTIES_PATH"
      rm -f "${WRAPPER_PROPERTIES_PATH}.bak"
    else
      echo "distributionUrl=$GRADLE_DISTRIBUTION_URL" >> "$WRAPPER_PROPERTIES_PATH"
    fi
    log_success "Updated Gradle wrapper distribution URL"
  fi
}

update_build_gradle() {
  # Optional: Update build.gradle with compatible configurations
  if [ -f "$BUILD_GRADLE_PATH" ]; then
    backup_file "$BUILD_GRADLE_PATH"
    local java_version=$1

    # Extract major Java version if contains dot
    if [[ "$java_version" == *"."* ]]; then
      java_version=$(echo "$java_version" | cut -d. -f1)
    fi

    # Update Java compatibility in build.gradle if it exists
    if grep -q "JavaVersion.VERSION_" "$BUILD_GRADLE_PATH"; then
      sed -i.bak "s/JavaVersion.VERSION_[0-9_]*/JavaVersion.VERSION_${java_version}_/g" "$BUILD_GRADLE_PATH"
      rm -f "${BUILD_GRADLE_PATH}.bak"
      log_success "Updated Java compatibility in build.gradle to Java $java_version"
    fi
  fi
}

clean_gradle_cache() {
  log_info "Cleaning Gradle cache..."
  rm -rf ~/.gradle/caches/
  log_success "Gradle cache cleaned"
}

initialize_flutter_project() {
  # If this is a new project or needs reconfiguration
  if [ ! -f "android/gradlew" ]; then
    log_info "Initializing Flutter project gradle wrapper..."
    if ! is_installed flutter; then
      log_error "Flutter not found. Please install Flutter first."
      return 1
    fi

    # Run flutter commands to generate gradle files
    flutter pub get
    cd android && ./gradlew wrapper
    cd ..
    log_success "Flutter project gradle wrapper initialized"
  fi
}

# --------------------- MAIN FUNCTIONALITY ---------------------

show_usage() {
  cat << EOF
Usage: source $(basename "$0") [OPTIONS] [VERSION]

Configure Java environment for Flutter project.

Options:
  -h, --help         Show this help message
  -l, --list         List supported Java versions
  -c, --current      Show current Java configuration
  -i, --init         Initialize/repair Flutter project gradle files
  --clean-cache      Clean Gradle cache
  --update-gradle    Update Gradle version (arg: version like 7.6)

VERSION:
  Java version to use (${!JAVA_VERSIONS[@]})
  Default: $DEFAULT_JAVA_VERSION

Examples:
  source $(basename "$0") 17                 # Switch to Java 17
  source $(basename "$0") --list             # Show supported versions
  source $(basename "$0") --update-gradle 8.0  # Update Gradle version

Note: This script must be sourced, not executed directly.
EOF
}

list_supported_versions() {
  echo "Supported Java Versions:"
  echo "------------------------"
  for version in $(get_java_versions); do
    local package_info=${JAVA_VERSIONS[$version]}
    local package="${package_info%%:*}"
    local path="${package_info#*:}"

    echo "Java $version:"
    echo "  - Package: $package"
    echo "  - Path: $path"

    # Check if installed
    if [ -x "$path/bin/java" ]; then
      echo "  - Status: Installed ✓"
    elif [ "$PACKAGE_MANAGER" = "apt" ] && dpkg -l | grep -q "$package"; then
      echo "  - Status: Installed (path may differ) ✓"
    elif [ "$PACKAGE_MANAGER" = "dnf" ] || [ "$PACKAGE_MANAGER" = "yum" ]; then
      if rpm -q "$package" >/dev/null 2>&1; then
        echo "  - Status: Installed (path may differ) ✓"
      else
        echo "  - Status: Not installed ✗"
      fi
    elif [ "$PACKAGE_MANAGER" = "brew" ] && brew list | grep -q "$package"; then
      echo "  - Status: Installed (path may differ) ✓"
    else
      echo "  - Status: Not installed ✗"
    fi
    echo ""
  done
}

update_gradle_version() {
  local new_version=$1
  if [ -z "$new_version" ]; then
    log_error "No Gradle version specified"
    return 1
  fi

  GRADLE_DISTRIBUTION_URL="https://services.gradle.org/distributions/gradle-${new_version}-all.zip"
  log_info "Setting Gradle distribution URL to: $GRADLE_DISTRIBUTION_URL"
  update_gradle_wrapper
  log_success "Gradle updated to version $new_version"
}

set_java_version() {
  local version=${1:-$DEFAULT_JAVA_VERSION}

  # Validate version
  local valid=0
  for v in $(get_java_versions); do
    if [ "$v" = "$version" ]; then
      valid=1
      break
    fi
  done

  if [ $valid -eq 0 ]; then
    log_error "Unsupported Java version: $version"
    log_info "Supported versions: $(get_java_versions)"
    return 1
  fi

  # Ensure Java version is installed
  if ! install_java_version "$version"; then
    log_error "Could not ensure Java $version is installed"
    return 1
  fi

  # Get Java path
  local java_path=$(get_java_path "$version")
  if [ -z "$java_path" ]; then
    return 1
  fi

  # Validate Java installation
  local validated_path=$(validate_java_installation "$java_path" "$version")
  if [ $? -ne 0 ]; then
    log_error "Java $version validation failed"
    return 1
  fi

  if [ -n "$validated_path" ]; then
    java_path="$validated_path"
  fi

  # Set environment variables
  export JAVA_HOME="$java_path"
  export PATH="$JAVA_HOME/bin:$PATH"

  # Update project files
  update_gradle_properties
  update_gradle_wrapper
  update_build_gradle "$version"

  log_success "Successfully configured Java $version for your Flutter project"
  show_current_java
  return 0
}

# --------------------- SCRIPT ENTRY POINT ---------------------

# Detect system type and package manager
detect_system

# Check if script is being sourced
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
  echo "Error: This script must be sourced, not executed directly."
  echo "Please run: source $(basename "$0") [OPTIONS] [VERSION]"
  exit 1
fi

# Process command line arguments
case "$1" in
  -h|--help)
    show_usage
    return 0
    ;;
  -l|--list)
    list_supported_versions
    return 0
    ;;
  -c|--current)
    show_current_java
    return 0
    ;;
  -i|--init)
    initialize_flutter_project
    return $?
    ;;
  --clean-cache)
    clean_gradle_cache
    return $?
    ;;
  --update-gradle)
    update_gradle_version "$2"
    return $?
    ;;
  "")
    set_java_version "$DEFAULT_JAVA_VERSION"
    ;;
  *)
    set_java_version "$1"
    ;;
esac