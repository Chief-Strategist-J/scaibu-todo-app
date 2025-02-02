analyze_release_impact() {
    local from_tag="$1"
    local to_tag="${2:-HEAD}"

    echo "=== Release Impact Analysis ==="

    # Compare changes between tags
    echo "Analyzing changes between $from_tag and $to_tag..."

    # Feature changes
    echo "Feature changes:"
    git log "$from_tag..$to_tag" --grep="feat:" --pretty=format:"  * %s" || echo "  No feature changes found"

    # Breaking changes
    echo -e "\nBreaking changes:"
    git log "$from_tag..$to_tag" --grep="BREAKING CHANGE" --pretty=format:"  * %s" || echo "  No breaking changes found"

    # API changes
    echo -e "\nAPI changes:"
    git diff "$from_tag..$to_tag" -- "**/api/*" "**/controllers/*" | grep "^+" | sed 's/^/  /'

    # Database schema changes
    echo -e "\nDatabase schema changes:"
    git diff "$from_tag..$to_tag" -- "**/*schema*" "**/*migration*" | grep "^+" | sed 's/^/  /'

    # Generate changelog
    echo -e "\nDetailed changelog:"
    git log "$from_tag..$to_tag" --pretty=format:"  * %h - %s (%an)" --reverse
}