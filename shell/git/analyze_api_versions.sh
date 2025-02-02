analyze_api_versions() {
    local days="${1:-30}"

    echo "=== API Version Analysis ==="

    # Track API endpoint changes
    echo "API Endpoint Evolution:"
    git log --since="$days days ago" --name-only --pretty=format:"" |
        grep -E "api/.*\.(js|py|java|ts)" | sort | uniq |
        while read -r api_file; do
            echo "Analyzing $api_file:"
            # Track endpoint changes
            git log --format="  %h - %s (%ar)" -- "$api_file"

            # Analyze current endpoints
            if [ -f "$api_file" ]; then
                echo "  Current endpoints:"
                case "$api_file" in
                    *.js|*.ts)
                        grep -E "@(Get|Post|Put|Delete|Patch)" "$api_file" | sed 's/^/    /'
                        ;;
                    *.py)
                        grep -E "@route|@app\.(get|post|put|delete|patch)" "$api_file" | sed 's/^/    /'
                        ;;
                    *.java)
                        grep -E "@(Get|Post|Put|Delete|Patch)Mapping" "$api_file" | sed 's/^/    /'
                        ;;
                esac
            fi
    done

    # Check API versioning patterns
    echo -e "\nAPI Version Pattern Analysis:"
    find . -type f -name "swagger*.yaml" -o -name "openapi*.yaml" |
        while read -r spec_file; do
            echo "Analyzing $spec_file:"
            grep -E "version:|/v[0-9]+/" "$spec_file" | sed 's/^/  /'
    done
}