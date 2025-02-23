from typing import List, Tuple, Optional


class SQLSchema:
    """Handles SQL schema and statement generation."""
    SCHEMA = """
    CREATE TABLE IF NOT EXISTS dependencies (
        id SERIAL PRIMARY KEY,
        project_name VARCHAR(255),
        project_version VARCHAR(50),
        dependency_name VARCHAR(255),
        dependency_version VARCHAR(50),
        parent_dependency VARCHAR(255),
        file_name VARCHAR(255),
        sdk_version VARCHAR(100)
    );
    """

    @staticmethod
    def generate_insert_statements(
            dependencies: List[Tuple[str, str, str, str, Optional[str], str, str]]) -> str:
        """Generates SQL INSERT statements for dependencies."""
        return "\n".join(
            f"""
            INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('{dep[0]}', '{dep[1]}', '{dep[2]}', '{dep[3]}', {f"'{dep[4]}'" if dep[4] else 'NULL'}, '{dep[5]}', '{dep[6]}');
            """.strip()
            for dep in dependencies
        )
