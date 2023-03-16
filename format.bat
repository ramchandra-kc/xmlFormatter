@echo off
rem Format all XML files in the directory and its subfolders recursively
echo formatting
set "folder1=%~1"

if "%folder1%" neq "" (
    for /r "%folder1%" %%f in (*.xml *.rels) do (
        xmllint --format "%%f" --output "%%f"
    )
)