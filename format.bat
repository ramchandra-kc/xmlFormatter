@echo off
rem Format all XML files in the directory and its subfolders recursively
echo formatting
set "folder1=%~1"

if "%folder1%" neq "" (
    for /r "%folder1%" %%f in (*.xml *.rels) do (
        "./xmllint.exe" --format "%%f" --output "%%f"
    )
)

set "folder2=%~2"

if "%folder2%" neq "" (
    for /r "%folder2%" %%f in (*.xml *.rels) do (
        "./xmllint.exe" --format "%%f" --output "%%f"
    )
)

set "folder3=%~3"

if "%folder3%" neq "" (
    for /r "%folder3%" %%f in (*.xml *.rels) do (
        "./xmllint.exe" --format "%%f" --output "%%f"
    )
)