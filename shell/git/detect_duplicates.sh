detect_duplicates() {
    local min_lines="${1:-5}"

    echo "=== Code Duplication Detection ==="

    # Create temporary files for analysis
    temp_dir=$(mktemp -d)

    # Extract code blocks for comparison
    git ls-files "*.js" "*.ts" "*.py" "*.java" | while read -r file; do
        if [ -f "$file" ]; then
            awk -v min="$min_lines" '
            BEGIN { block = ""; count = 0; }
            /^[[:space:]]*$/ {
                if (count >= min) {
                    print block > FILENAME "_blocks"
                }
                block = "";
                count = 0;
                next;
            }
            {
                block = block $0 "\n";
                count++;
            }' "$file"
        fi
    done

    # Compare blocks for duplicates
    echo "Searching for duplicate code blocks (minimum $min_lines lines)..."
    find . -name "*_blocks" -type f | while read -r block_file; do
        sort "$block_file" | uniq -d | while read -r duplicate; do
            echo "Found duplicate code block in ${block_file%_blocks}:"
            echo "$duplicate"
            echo "---"
        done
    done

    # Cleanup
    rm -rf "$temp_dir"
}