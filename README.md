# Format .xml and .rls files

Format all .xml and .rels files located inside a folder using .bat file.

I have used xmllint to format xml files.

xmllint usage
```powershell
xmllint --format "filename" --output "outputFilename"
```

## Examples

```powershell
format.bat "Folder Name"
```