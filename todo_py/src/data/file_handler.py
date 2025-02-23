from typing import List, Tuple, Optional
import os


class FileHandler:
    """Handles file reading and writing."""
    @staticmethod
    def read_file(file_path: str) -> List[str]:
        """Reads a file and returns its lines."""
        with open(file_path, 'r', encoding='utf-8') as file:
            return file.readlines()

    @staticmethod
    def save_file(file_name: str, content: str) -> None:
        """Saves content to a file, ensuring the directory exists."""
        dir_name = os.path.dirname(file_name)
        os.makedirs(dir_name, exist_ok=True)  # ✅ Ensure the directory exists

        with open(file_name, "w", encoding="utf-8") as f:
            f.write(content)
