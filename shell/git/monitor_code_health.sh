monitor_code_health() {
    local days="${1:-30}"

    echo "=== Code Health Monitoring ==="

    # Code churn metrics
    echo "Code churn analysis (last $days days):"
    git log --since="$days days ago" --numstat | awk '
    /^[0-9]/ {
        added += $1
        deleted += $2
        files[$3] += $1 + $2
    }
    END {
        printf "Total lines added: %d\n", added
        printf "Total lines deleted: %d\n", deleted
        printf "Churn ratio: %.2f\n", (added + deleted) / NR
        print "\nMost volatile files:"
        for (file in files)
            printf "  %s: %d changes\n", file, files[file]
    }' | sort -rn | head -n 10

    # Technical debt indicators
    echo -e "\nTechnical debt indicators:"
    git ls-files | while read -r file; do
        if [ -f "$file" ]; then
            todo_count=$(grep -c -E "TODO|FIXME|XXX|HACK" "$file")
            if [ "$todo_count" -gt 0 ]; then
                echo "  $file: $todo_count markers"
            fi
        fi
    done

    # Code quality trends
    echo -e "\nCode quality trends:"
    git log --since="$days days ago" --format="%h" | while read -r commit; do
        commit_date=$(git show -s --format="%ci" "$commit")
        commit_files=$(git show --name-only "$commit")
        echo "Commit $commit ($commit_date):"
        echo "$commit_files" | while read -r file; do
            if [ -f "$file" ]; then
                complexity=$(analyze_complexity "$file" 2>/dev/null)
                echo "  $file: $complexity"
            fi
        done
    done
}