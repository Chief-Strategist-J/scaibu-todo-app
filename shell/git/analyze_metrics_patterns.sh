analyze_metrics_patterns() {
    echo "=== Metrics Pattern Analysis ==="

    # Analyze metrics collection
    echo "Metrics Collection Patterns:"
    git ls-files | while read -r file; do
        if [ -f "$file" ]; then
            case "$file" in
                *.js|*.ts)
                    echo "JavaScript/TypeScript metrics in $file:"
                    grep -n "metrics\.|measure\.|counter\." "$file" | sed 's/^/  /'
                    ;;
                *.py)
                    echo "Python metrics in $file:"
                    grep -n "prometheus_client\|statsd" "$file" | sed 's/^/  /'
                    ;;
                *.java)
                    echo "Java metrics in $file:"
                    grep -n "Metrics\.|Counter\.|Gauge\." "$file" | sed 's/^/  /'
                    ;;
            esac
        fi
    done

    # Analyze metric definitions
    echo -e "\nMetric Definitions:"
    find . -type f -name "*metrics*.yml" -o -name "*metrics*.json" |
        while read -r metrics_file; do
            echo "Analyzing $metrics_file:"
            case "$metrics_file" in
                *.yml)
                    grep -E "name:|type:|help:" "$metrics_file" | sed 's/^/  /'
                    ;;
                *.json)
                    grep -E "\"name\":|\"type\":|\"description\":" "$metrics_file" | sed 's/^/  /'
                    ;;
            esac
    done
}