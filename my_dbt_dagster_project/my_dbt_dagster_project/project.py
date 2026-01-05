from pathlib import Path

from dagster_dbt import DbtProject

airbnb_project = DbtProject(
    project_dir=Path(__file__).joinpath("..", "..", "..", "airbnb").resolve(),
    packaged_project_dir=Path(__file__).joinpath("..", "..", "dbt-project").resolve(),
    profiles_dir=Path.home() / ".dbt", # Adjust this path if your profiles.yml is located elsewhere
)
airbnb_project.prepare_if_dev()