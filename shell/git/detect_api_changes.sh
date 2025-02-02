detect_api_changes() {
    local branch="${1:-$(git rev-parse --abbrev-ref HEAD)}"

    echo "=== API Change Detection ==="

    # Detect API changes
    echo "Analyzing API changes..."
    git diff "$branch" | while read -r line; do
        case "$line" in
            *"@api"*|*"@route"*|*"@endpoint"*)
                echo "API change detected:"
                echo "$line" | sed 's/^/  /'
                ;;
        esac
    done

    # Check for breaking changes
    echo -e "\nPotential breaking changes:"
    git diff "$branch" | grep -E "function.*\(.*\)|class.*\{|interface.*\{" -B 1 -A 1
}