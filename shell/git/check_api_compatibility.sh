check_api_compatibility() {
    local old_ref="$1"
    local new_ref="${2:-HEAD}"

    echo "=== API Compatibility Check ==="

    # Compare API specifications
    echo "API Specification Changes:"
    for spec_file in $(git ls-files "*swagger*.yaml" "*openapi*.yaml"); do
        if [ -f "$spec_file" ]; then
            echo "Analyzing changes in $spec_file:"
            git diff "$old_ref..$new_ref" -- "$spec_file" | grep -E "^\+.*:|^-.*:" | sed 's/^/  /'
        fi
    done

    # Check for breaking changes
    echo -e "\nPotential Breaking Changes:"
    git diff "$old_ref..$new_ref" | while read -r line; do
        case "$line" in
            *"@Deprecated"*|*"@deprecated"*)
                echo "  Deprecation found: $line"
                ;;
            *"BREAKING CHANGE"*)
                echo "  Breaking change marked: $line"
                ;;
        esac
    done
}
