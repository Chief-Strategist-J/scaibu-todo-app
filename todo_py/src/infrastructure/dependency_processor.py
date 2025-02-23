import os
from datetime import datetime

from ..data.file_handler import FileHandler
from ..domain.sql_schema import SQLSchema
from ..infrastructure.dependency_parser import DependencyParser


class DependencyProcessor:
    """Handles the overall process of dependency parsing and SQL generation."""

    def __init__(self, file_path: str):
        self.file_path = file_path

    def process(self) -> None:
        """Executes the full process."""
        parser = DependencyParser(self.file_path)
        dependencies = parser.parse()
        sql_script = SQLSchema.SCHEMA + "\n" + SQLSchema.generate_insert_statements(dependencies)

        date_str = datetime.now().strftime("%Y-%m-%d")
        output_file = f"src/domain/sql/{date_str}_dependencies.sql"
        FileHandler.save_file(output_file, sql_script)
        print(f"SQL script generated and saved to {output_file}")

        # Delete original log file
        try:
            os.remove(self.file_path)
            print(f"Deleted original log file: {self.file_path}")
        except Exception as e:
            print(f"Warning: Could not delete file {self.file_path}: {e}")
