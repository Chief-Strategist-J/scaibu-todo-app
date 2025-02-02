generate_dependency_graph() {
    local file_pattern="${1:-*}"

    echo "=== Module Dependency Graph Generation ==="

    # Create temporary files for graph generation
    temp_dir=$(mktemp -d)
    graph_file="$temp_dir/dependency_graph.dot"

    # Initialize DOT file
    echo "digraph DependencyGraph {" > "$graph_file"
    echo "  node [shape=box];" >> "$graph_file"

    # Analyze dependencies
    git ls-files "*.$file_pattern" | while read -r file; do
        if [ -f "$file" ]; then
            case "$file" in
                *.js|*.ts)
                    deps=$(grep -o "import.*from.*['\"].*['\"]" "$file" |
                          sed -E "s/.*from.*['\"](.+)['\"].*/\1/")
                    ;;
                *.py)
                    deps=$(grep -E "^(import|from.*import)" "$file" |
                          sed -E "s/from[[:space:]]+([^[:space:]]+).*/\1/")
                    ;;
                *.java)
                    deps=$(grep -E "^import" "$file" |
                          sed -E "s/import[[:space:]]+([^;]+);/\1/")
                    ;;
            esac

            if [ -n "$deps" ]; then
                while read -r dep; do
                    echo "  \"$(basename "$file")\" -> \"$(basename "$dep")\";" >> "$graph_file"
                done <<< "$deps"
            fi
        fi
    done

    echo "}" >> "$graph_file"
    echo "Dependency graph generated at: $graph_file"
}