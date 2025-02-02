monitor_security_patterns() {
    echo "=== Security Pattern Monitoring ==="

    # Check for sensitive file patterns
    echo "Sensitive File Pattern Check:"
    git ls-files | grep -E "\.(pem|key|cert|pwd|password)$" || echo "  No sensitive file extensions found"

    # Check for sensitive content patterns
    echo -e "\nSensitive Content Pattern Check:"
    git ls-files | while read -r file; do
        if [ -f "$file" ]; then
            # Search for potential sensitive data patterns
            patterns=(
                "password[[:space:]]*=[[:space:]]*['\"][^'\"]+['\"]"
                "api[_]?key[[:space:]]*=[[:space:]]*['\"][^'\"]+['\"]"
                "secret[[:space:]]*=[[:space:]]*['\"][^'\"]+['\"]"
                "-----BEGIN.*PRIVATE KEY-----"
            )

            for pattern in "${patterns[@]}"; do
                if grep -E "$pattern" "$file" > /dev/null; then
                    echo "  Warning: Potential sensitive data in $file"
                    break
                fi
            done
        fi
    done

    # Check for security-related commits
    echo -e "\nSecurity-Related Commits:"
    git log --grep="security\|vulnerability\|CVE" --pretty=format:"  %h - %s"
}
