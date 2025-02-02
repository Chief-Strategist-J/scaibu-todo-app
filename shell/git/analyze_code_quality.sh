#!/usr/bin/env bash

# Configuration
BRANCH="${1:-$(git rev-parse --abbrev-ref HEAD)}"  # Default to current branch if not provided
FILE_PATTERNS="*.[ch] *.cpp *.js *.py"              # File types to analyze for function complexity
SIZE_THRESHOLDS=(1 10 100)                          # Size thresholds for categorizing files (KB)
FUNCTION_REGEX="^[[:space:]]*(function|def|public|private|protected)[[:space:]].*\("  # Function definitions regex
SIZE_REGEX="^[[:space:]]*{"                          # Opening brace for function logic

analyze_code_quality() {
    echo "=== Code Quality Metrics ==="

    # Function complexity analysis
    echo "Function Complexity (lines per function):"
    git ls-files $FILE_PATTERNS | while read -r file; do
        echo "Analyzing $file..."
        awk -v regex="$FUNCTION_REGEX" -v brace="$SIZE_REGEX" '
        {
            if ($0 ~ regex) {
                if (count > 0) {
                    sum += count
                    functions++
                    if (count > max) max = count
                }
                count = 0
            }
            if ($0 ~ brace) count++
        }
        END {
            if (functions > 0) printf "Average: %.1f, Max: %d\n", sum/functions, max
        }' "$file"
    done

    # File size distribution
    echo -e "\nFile Size Distribution:"
    git ls-files | while read -r file; do
        if [ -f "$file" ]; then
            size=$(stat -f %z "$file" 2>/dev/null || stat -c %s "$file")
            size_kb=$((size / 1024))  # Convert size to KB
            if [ "$size_kb" -lt "${SIZE_THRESHOLDS[0]}" ]; then
                small++
            elif [ "$size_kb" -lt "${SIZE_THRESHOLDS[1]}" ]; then
                medium++
            elif [ "$size_kb" -lt "${SIZE_THRESHOLDS[2]}" ]; then
                large++
            else
                xlarge++
            fi
            total++
        fi
    done | awk -v small=$small -v medium=$medium -v large=$large -v xlarge=$xlarge -v total=$total '
        END {
            printf "Small (<1KB): %.1f%%\n", (small/total)*100
            printf "Medium (1-10KB): %.1f%%\n", (medium/total)*100
            printf "Large (10-100KB): %.1f%%\n", (large/total)*100
            printf "Extra Large (>100KB): %.1f%%\n", (xlarge/total)*100
        }'
}

# Execute the function
analyze_code_quality
