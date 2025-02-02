security_scan() {
    local branch="${1:-$(git rev-parse --abbrev-ref HEAD)}"

    echo "=== Security Analysis ==="

    # Scan for sensitive information
    echo "Scanning for sensitive information..."
    git diff "$branch" | grep -i -E "password|secret|key|token|credential" -C 2

    # Check for common security patterns
    echo -e "\nChecking security patterns..."
    git ls-files | while read -r file; do
        if [ -f "$file" ]; then
            case "$file" in
                *.js|*.ts)
                    echo "Checking JavaScript/TypeScript file: $file"
                    grep -H -n -E "eval\(|setTimeout\(.*\)|setInterval\(.*\)" "$file"
                    ;;
                *.py)
                    echo "Checking Python file: $file"
                    grep -H -n -E "exec\(|eval\(|os\.system\(|subprocess\.call\(" "$file"
                    ;;
                *.java)
                    echo "Checking Java file: $file"
                    grep -H -n -E "Runtime\.exec\(|ProcessBuilder\(" "$file"
                    ;;
            esac
        fi
    done

    # Check for outdated dependencies
    echo -e "\nChecking dependency files..."
    if [ -f "package.json" ]; then
        echo "Node.js dependencies:"
        grep -E "\"dependencies\"|\"devDependencies\"" package.json -A 20
    fi
    if [ -f "requirements.txt" ]; then
        echo "Python dependencies:"
        cat requirements.txt
    fi
}
