import sys
import os

from src.infrastructure.dependency_processor import DependencyProcessor


def main():
    """Main function."""
    if len(sys.argv) != 2:
        print("Usage: todo_py convert_deps_to_sql.py <dependency_log_file>")
        sys.exit(1)

    file_path = sys.argv[1]
    if not os.path.isfile(file_path):
        print(f"Error: File {file_path} not found.")
        sys.exit(1)

    processor = DependencyProcessor(file_path)
    processor.process()

if __name__ == "__main__":
    main()
