analyze_pipeline() {
    local days="${1:-30}"

    echo "=== CI/CD Pipeline Analysis ==="

    # Analyze CI configuration
    echo "CI/CD Configuration Analysis:"
    for ci_file in .github/workflows/*.yml .gitlab-ci.yml .circleci/config.yml Jenkinsfile; do
        if [ -f "$ci_file" ]; then
            echo "Found CI config: $ci_file"
            # Extract and analyze pipeline stages
            case "$ci_file" in
                *.yml)
                    grep -E "jobs:|stages:|steps:" "$ci_file" | sed 's/^/  /'
                    ;;
                Jenkinsfile)
                    grep -E "stage|steps|sh " "$ci_file" | sed 's/^/  /'
                    ;;
            esac
        fi
    done

    # Analyze build history
    echo -e "\nBuild History Analysis:"
    git log --since="$days days ago" --grep="ci:" --pretty=format:"  %h - %s (%ar)"

    # Check deployment frequency
    echo -e "\nDeployment Frequency:"
    git log --since="$days days ago" --grep="deploy:" --pretty=format:"%ad" --date=short | uniq -c
}