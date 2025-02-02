analyze_architecture() {
    local directory="${1:-.}"

    echo "=== Architecture Pattern Analysis ==="

    # Detect common architecture patterns
    echo "Analyzing architectural patterns..."

    # MVC Pattern Detection
    echo "Checking for MVC pattern:"
    find "$directory" -type d -name "models" -o -name "views" -o -name "controllers" | while read -r dir; do
        echo "Found MVC component: $dir"
        ls -R "$dir" | grep -v ":" | sed 's/^/  /'
    done

    # Microservices Detection
    echo -e "\nChecking for microservices architecture:"
    find "$directory" -name "docker-compose*.yml" -o -name "Dockerfile" | while read -r file; do
        echo "Found container definition: $file"
        grep -E "service:|image:" "$file" 2>/dev/null | sed 's/^/  /'
    done

    # API Layer Detection
    echo -e "\nAnalyzing API structure:"
    find "$directory" -type f -exec grep -l "@api\|@route\|@endpoint" {} \; | while read -r file; do
        echo "Found API definition in: $file"
        grep -E "@api|@route|@endpoint" "$file" | sed 's/^/  /'
    done
}