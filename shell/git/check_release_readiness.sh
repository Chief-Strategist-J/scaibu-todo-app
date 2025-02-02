check_release_readiness() {
    local branch="${1:-$(git rev-parse --abbrev-ref HEAD)}"

    echo "=== Release Readiness Check ==="

    # Check test coverage
    echo "Test coverage status:"
    find . -name "coverage.xml" -o -name "coverage-final.json" | while read -r coverage_file; do
        echo "Found coverage report: $coverage_file"
        grep -E "line-rate|\"lines\":|covered" "$coverage_file" 2>/dev/null | head -n 5
    done

    # Check documentation status
    echo -e "\nDocumentation status:"
    git ls-files "*.md" "*.rst" "docs/*" | while read -r doc_file; do
        last_modified=$(git log -1 --format="%ar" -- "$doc_file")
        echo "  $doc_file (Last modified: $last_modified)"
    done

    # Check dependencies
    echo -e "\nDependency status:"
    for dep_file in package.json requirements.txt pom.xml build.gradle; do
        if [ -f "$dep_file" ]; then
            echo "Found dependency file: $dep_file"
            git log -1 --format="  Last updated: %ar" -- "$dep_file"
        fi
    done

    # Check for pending migrations
    echo -e "\nPending migrations:"
    find . -path "*/migrations/*" -type f -newer "$(git rev-parse --git-dir)/refs/heads/$branch" 2>/dev/null
}