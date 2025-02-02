#!/usr/bin/env bash
# 20. Advanced Git Hooks Manager
manage_hooks() {
    local action="$1"
    local hook_type="$2"

    echo "=== Git Hooks Manager ==="

    local hooks_dir=".git/hooks"
    local available_hooks=(
        "pre-commit"
        "prepare-commit-msg"
        "commit-msg"
        "post-commit"
        "pre-push"
        "post-checkout"
        "pre-rebase"
    )

    # Ensure the .git/hooks directory exists
    if [ ! -d "$hooks_dir" ]; then
        echo "Error: .git/hooks directory not found. Are you in a git repository?"
        return 1
    fi

    case "$action" in
        "list")
            echo "Available hooks:"
            for hook in "${available_hooks[@]}"; do
                if [ -x "$hooks_dir/$hook" ]; then
                    echo "✓ $hook (active)"
                else
                    echo "✗ $hook (inactive)"
                fi
            done
            ;;
        "install")
            if [ -n "$hook_type" ]; then
                # Install the specified hook
                case "$hook_type" in
                    "pre-commit")
                        cat > "$hooks_dir/pre-commit" << 'EOF'
#!/bin/bash
echo "Running pre-commit checks..."
# Add your pre-commit checks here
git diff --cached --name-only | while read file; do
    if [ -f "$file" ]; then
        # Check file size
        size=$(stat -f %z "$file" 2>/dev/null || stat -c %s "$file")
        if [ "$size" -gt 1000000 ]; then
            echo "Error: $file is too large ($(($size/1000))KB)"
            exit 1
        fi
    fi
done
EOF
                        chmod +x "$hooks_dir/pre-commit"
                        echo "Installed pre-commit hook"
                        ;;
                    "pre-push")
                        cat > "$hooks_dir/pre-push" << 'EOF'
#!/bin/bash
echo "Running pre-push checks..."
# Add your pre-push checks here
# For example, checking if all tests pass
if ! ./run_tests.sh; then
    echo "Tests failed, aborting push."
    exit 1
fi
EOF
                        chmod +x "$hooks_dir/pre-push"
                        echo "Installed pre-push hook"
                        ;;
                    *)
                        echo "Hook type not supported yet"
                        ;;
                esac
            else
                echo "Please specify hook type"
            fi
            ;;
        "remove")
            if [ -n "$hook_type" ]; then
                if [ -x "$hooks_dir/$hook_type" ]; then
                    rm "$hooks_dir/$hook_type"
                    echo "Removed $hook_type hook"
                else
                    echo "$hook_type hook is not installed"
                fi
            else
                echo "Please specify hook type to remove"
            fi
            ;;
        *)
            echo "Usage: manage_hooks [list|install|remove] [hook-type]"
            ;;
    esac
}
