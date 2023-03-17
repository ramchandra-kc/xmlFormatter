# Format .xml and .rls files 

Format all .xml and .rels files located inside a folder using .bat ore exe file.

I have used xmllint to format xml files.

xmllint usage
```powershell
xmllint --format "inputFilePath" --output "outputFilePath"
```
for more options see 
```powershell
xmllint --help
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

# Using AutoHotKey (.ahk) to Format and Extract

it is possible to directly run script commands using shortcut using AutoHotKey. I have used it to create shortcut for extract + format and archive to zip file.

You will need 7z installed and in system path.
formatt.bat in system path
xmllint in system path.

## Extract
To extract and format selected archive(.zip, .docx, .pptx, .xlsx ) and so on
```shortcut
Ctrl + Shift + E
```

## Archive with dynamic ext
To zip selected files
For extension as `.docx`, `.xlsx`, `.zip`, `.pptx` use 
```
Ctrl + Shift + Z
```
Note: The `.docx, .xlsx, .pptx,` are created if one of the selected folder is `word, xl, ppt` respectively and `.zip` for rest of the cases.

## Archive with .zip ext
To simply create archive for selected files,
Use:
```
Ctrl + Alt + Z
```

Note: Destination of archive or extract will be the current folder and name of zip will be the name of its parent directory.

If it already exists, then version(v) followed by number is created.

For ex: if Inside test folder, test.zip is already there then testv1.zip will be created and if testv1.zip also exists then testv2.zip will be created and so on.


# Installations

1. Install 7zip and add it to path.
2. Download extractFormatZip.zip from here, extract and add main folder to path.
3. Run zipExtractFormat.exe located inside the extracted path and run it to enable shortcuts.

