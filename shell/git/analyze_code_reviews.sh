analyze_code_reviews() {
    local days="${1:-30}"

    echo "=== Code Review Pattern Analysis ==="

    # Analyze pull request patterns
    echo "Pull Request Analysis:"
    for pr_dir in .github/pull_requests .gitlab/merge_requests; do
        if [ -d "$pr_dir" ]; then
            echo "Found PR directory: $pr_dir"
            find "$pr_dir" -type f -name "*.md" | while read -r pr_file; do
                echo "Analyzing PR: $pr_file"
                # Extract review comments
                grep -E "^>.*|^review:" "$pr_file" | sed 's/^/  /'
            done
        fi
    done

    # Analyze review comments in commits
    echo -e "\nReview Comment Analysis:"
    git log --since="$days days ago" --grep="review:" --pretty=format:"  %h - %s (%an)"

    # Track reviewer participation
    echo -e "\nReviewer Participation:"
    git log --since="$days days ago" --pretty=format:"%an: %s" |
        grep -i "reviewed-by\|reviewed by" | sort | uniq -c | sort -nr
}