# Format .xml and .rls files 

Format all .xml and .rels files located inside a folder using .bat ore exe file.

I have used xmllint to format xml files.

xmllint usage
```powershell
xmllint --format "filename" --output "outputFilename"
```
## Using EXE

For ease: you can download the .exe file and add it to system path, then you can directly use 
```powershell
formatt "Folder name" "Folder Name"
```
Note: you can format multiple folders.

## Using .bat

You will have to clone this repo and put the path of this repo in system variable, then to format use

```powershell
format.bat "Folder Name"
```