; Define the hotkey to trigger the script (Ctrl + E)
^e::
  selected_files:=  StrSplit(getSelected1(),"`n"," `r`n")
  Loop % selected_files.Length() {
    selected_file := Trim(selected_files[A_Index])
    Splitpath, selected_file, , fdir, , fnamene,
    outuptFolder:= fdir . "/" . fnamene
    ;Send, #r
    ;Sleep, 300
    ;Send, {Enter}
    ;Sleep, 900
    ;Send, 7z x "%selected_file%" -o"%outuptFolder%"
    if FileExist(outuptFolder)
      FileRemoveDir, %outuptFolder%, 1

    RunWait, 7z x "%selected_file%" -o"%outuptFolder%"  ; Extracting Files

    RunWait, format.bat "%outuptFolder%"                ; Foramating Files
  }
  getSelected1() {
    cO:=clipboardAll
    clipboard:=
    send ^c
    clipWait
    selected:=clipboard
    clipboard:=cO
    return selected
  }

  ; Refresh the Explorer window to show the extracted files
  IfWinActive, ahk_class CabinetWClass
  {
    WinGetClass, CabinetWClass, A
    ControlSend, , {F5}, ahk_class %CabinetWClass%
  }
  
  ; Clear the clipboard to prevent accidental pasting
  Clipboard :=
Return

^+z::
  ;Get current working folder
  Send, ^+n
  Send, {Enter}
  Send, ^+c
  Send, {Delete}
  Sleep, 500
  path := clipboard
  SplitPath, path, , dir
  folderPathA := StrSplit(dir, "\") ;"
  folderName := folderPathA[folderPathA.Length()]
  dir := StrReplace(dir, """","")
  folderPathA :=""
  wordFolder := dir . "/" . "word"
  pptxFolder := dir . "/" . "ppt"
  xlsxFolder := dir . "/" . "xl"
  extension := ""

  ;Getting the extension for zip file
  if FileExist(wordFolder){
    extension := ".docx"
  }
  
  if FileExist(pptxFolder){
    extension := ".pptx"
  }
  
  if FileExist(xlsxFolder){
    extension := ".xlsx"
  }
  
  if StrLen(extension) = 0 {
    extension := ".zip"
  }
  toExclude := ""
  outuptFolder := dir . "/" . folderName . "" . extension
  temp := 1
  ;If there outuptFolder is already there, do not consider it for ziping and change outuptFolder name
  while FileExist(outuptFolder){
    toExclude := toExclude . "-xr`!" . """" . outuptFolder . """" . " "
    outuptFolder :=dir . "/" . folderName . "v" . temp .  "" . extension
    temp := temp + 1
  }
  ;Zip command
  RunWait, 7z a -r "%outuptFolder%" "%dir%/*" %toExclude%

  ;Zip command
  ;Send, #r
  ;Sleep, 300
  ;Send, {Enter}
  ;Sleep, 900
  ;Send, 7z a -r  "%dir%/%folderName%%extension%" "%dir%/_rels/" "%dir%/docProps/" "%dir%/%folder%/" "%dir%/[Content_Types].xml" 
  
  ; Refresh the Explorer window to show the extracted files
  IfWinActive, ahk_class CabinetWClass
  {
    WinGetClass, CabinetWClass, A
    ControlSend, , {F5}, ahk_class %CabinetWClass%
  }
  
  ; Clear the clipboard to prevent accidental pasting
  Clipboard :=

Return
