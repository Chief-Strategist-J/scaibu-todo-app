import re
import os
from typing import List, Tuple, Optional

from ..data.file_handler import FileHandler


class DependencyParser:
    """Parses a dependency log file and extracts project and dependency data."""

    def __init__(self, file_path: str):
        self.file_path = file_path
        self.file_name = os.path.basename(file_path)
        self.project_name: Optional[str] = None
        self.project_version: Optional[str] = None
        self.sdk_version: Optional[str] = None
        self.dependencies: List[Tuple[str, str, str, str, Optional[str], str, str]] = []
        self.parent_stack: List[str] = []

    def extract_project_info(self, line: str) -> None:
        """Extracts the project name and version."""
        parts = line.split()
        self.project_name, self.project_version = parts[0], parts[1]

    def extract_sdk_version(self, line: str) -> None:
        """Extracts SDK version."""
        self.sdk_version = line if not self.sdk_version else f"{self.sdk_version}, {line}"

    def parse_dependency_line(self, line: str) -> Optional[Tuple[str, str, Optional[str]]]:
        """Parses a dependency line."""
        match = re.match(r'(├──|└──)?\s*([a-zA-Z0-9_\-]+)\s*(\d+\.\d+\.\d+)?', line)
        if match:
            _, dep_name, dep_version = match.groups()
            dep_version = dep_version or 'unknown'
            parent_dependency = self.parent_stack[-1] if self.parent_stack else None
            return dep_name, dep_version, parent_dependency
        return None

    def parse(self) -> List[Tuple[str, str, str, str, Optional[str], str, str]]:
        """Parses the dependency tree."""
        lines = FileHandler.read_file(self.file_path)
        for line in map(str.strip, lines):
            if line.startswith("todo_app"):
                self.extract_project_info(line)
            elif line.startswith("Dart SDK") or line.startswith("Flutter SDK"):
                self.extract_sdk_version(line)
            else:
                parsed_line = self.parse_dependency_line(line)
                if parsed_line:
                    dep_name, dep_version, parent_dependency = parsed_line
                    self.dependencies.append((
                        self.project_name, self.project_version, dep_name, dep_version,
                        parent_dependency, self.file_name, self.sdk_version
                    ))
                    if line.startswith("├──"):
                        self.parent_stack.append(dep_name)
                    elif line.startswith("└──") and self.parent_stack:
                        self.parent_stack.pop()
        return self.dependencies
