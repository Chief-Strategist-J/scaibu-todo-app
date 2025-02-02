
# 22. Code Path Analyzer
analyze_code_paths() {
    local start_file="$1"
    local max_depth="${2:-3}"

    echo "=== Code Path Analysis ==="

    function trace_dependencies() {
        local file="$1"
        local depth="$2"
        local visited=()

        if [ "$depth" -gt "$max_depth" ]; then
            return
        fi

        echo "${depth}: Analyzing $file"

        # Different analysis based on file type
        case "$file" in
            *.js|*.ts)
                grep -o "import.*from.*['\"].*['\"]" "$file" |
                while read -r dep; do
                    dep_file=$(echo "$dep" | sed -E "s/.*from.*['\"](.+)['\"].*/\1/")
                    if [[ ! " ${visited[@]} " =~ " ${dep_file} " ]]; then
                        visited+=("$dep_file")
                        trace_dependencies "$dep_file" $((depth + 1))
                    fi
                done
                ;;
            *.py)
                grep -E "^(import|from.*import)" "$file" |
                while read -r dep; do
                    dep_file=$(echo "$dep" | awk '{print $2}' | sed 's/\..*//')
                    if [[ ! " ${visited[@]} " =~ " ${dep_file} " ]]; then
                        visited+=("$dep_file")
                        trace_dependencies "$dep_file.py" $((depth + 1))
                    fi
                done
                ;;
        esac
    }

    if [ -f "$start_file" ]; then
        trace_dependencies "$start_file" 0
    else
        echo "File not found: $start_file"
    fi
}
